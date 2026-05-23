%% final_readme_polish_and_link_check.m
% Final README polish and link/path check for UrbanEV-BBW-RFLP-Verification

clear
clc
close all

projectRoot = "C:\Users\USER\Desktop\github\UrbanEV_BBW_FRESH";
cd(projectRoot)

if ~isfolder("docs")
    mkdir("docs")
end

if ~isfolder("results")
    mkdir("results")
end

if ~isfolder("matlab")
    mkdir("matlab")
end

if isfile("matlab.mat")
    delete("matlab.mat")
end

%% Move loose helper scripts from root to matlab folder

scriptPatterns = [
    "build_*.m"
    "repair_*.m"
    "final_scope_*.m"
    "fix_overclaim_*.m"
    "final_readme_*.m"
];

for p = 1:numel(scriptPatterns)
    d = dir(scriptPatterns(p));

    for i = 1:numel(d)
        src = string(d(i).name);
        dst = "matlab/" + src;

        if isfile(src)
            copyfile(src, dst, "f")
            delete(src)
            disp("Moved to matlab/: " + src)
        end
    end
end

%% Check README exists

readmeFile = "README.md";

if ~isfile(readmeFile)
    error("README.md was not found in the project root.")
end

readmeLines = readlines(readmeFile);
readmeLines = readmeLines(:);

%% Add final review evidence section if missing

marker = "## Final Review Evidence";

if contains(join(readmeLines,newline), marker)
    disp("README already contains Final Review Evidence section.")
else
    newSection = strings(0,1);

    newSection(end+1,1) = "";
    newSection(end+1,1) = "## Final Review Evidence";
    newSection(end+1,1) = "";
    newSection(end+1,1) = "The repository includes final audit files used to check course alignment, repository completeness, README path consistency, and scope-safe wording.";
    newSection(end+1,1) = "";
    newSection(end+1,1) = "Final audit documentation:";
    newSection(end+1,1) = "";
    newSection(end+1,1) = "- `docs/45_final_course_alignment_audit.md`";
    newSection(end+1,1) = "- `docs/46_final_repository_quality_check.md`";
    newSection(end+1,1) = "- `docs/47_final_scope_claim_audit.md`";
    newSection(end+1,1) = "- `docs/48_final_readme_link_check.md`";
    newSection(end+1,1) = "";
    newSection(end+1,1) = "Machine-readable audit matrices:";
    newSection(end+1,1) = "";
    newSection(end+1,1) = "- `results/mandatory_content_gap_closure_matrix.csv`";
    newSection(end+1,1) = "- `results/final_repository_quality_check.csv`";
    newSection(end+1,1) = "- `results/final_scope_claim_audit.csv`";
    newSection(end+1,1) = "- `results/final_readme_link_check.csv`";
    newSection(end+1,1) = "";
    newSection(end+1,1) = "Scope note: these audits support university-level project review only. They do not claim industrial completeness, certified safety compliance, ISO 26262 validation, SOTIF validation, HIL/SIL validation, or production brake-by-wire design.";

    readmeLines = [readmeLines; newSection];
    writelines(readmeLines, readmeFile)

    disp("README updated with Final Review Evidence section.")
end

%% Re-read README after update

readmeLines = readlines(readmeFile);
readmeLines = readmeLines(:);

%% Extract path-like items from backticks and markdown links

candidates = strings(0,1);
source_line = zeros(0,1);
source_type = strings(0,1);

knownExtensions = [
    ".md"
    ".csv"
    ".png"
    ".jpg"
    ".jpeg"
    ".svg"
    ".pdf"
    ".m"
    ".mlx"
    ".slx"
    ".mldatx"
    ".mat"
    ".txt"
    ".yaml"
    ".yml"
    ".json"
];

for i = 1:numel(readmeLines)

    line = string(readmeLines(i));

    % Backtick paths: `docs/file.md`
    tickTokens = regexp(line, '`([^`]+)`', 'tokens');

    for t = 1:numel(tickTokens)
        candidate = string(tickTokens{t}{1});
        candidate = strtrim(candidate);

        looksLikePath = contains(candidate,"/") || contains(candidate,"\") || any(endsWith(lower(candidate), lower(knownExtensions)));

        if looksLikePath && ~contains(candidate," ")
            candidates(end+1,1) = candidate;
            source_line(end+1,1) = i;
            source_type(end+1,1) = "backtick";
        end
    end

    % Markdown links: [text](docs/file.md)
    linkTokens = regexp(line, '\]\(([^)]+)\)', 'tokens');

    for t = 1:numel(linkTokens)
        candidate = string(linkTokens{t}{1});
        candidate = strtrim(candidate);

        isExternal = startsWith(lower(candidate),"http") || startsWith(lower(candidate),"mailto:") || startsWith(candidate,"#");

        if ~isExternal
            candidates(end+1,1) = candidate;
            source_line(end+1,1) = i;
            source_type(end+1,1) = "markdown_link";
        end
    end
end

%% Clean candidates

clean_path = strings(numel(candidates),1);

for i = 1:numel(candidates)
    pth = candidates(i);

    % Remove anchor part if present, e.g. docs/file.md#section
    parts = split(pth, "#");
    pth = parts(1);

    % Remove leading ./
    if startsWith(pth,"./")
        pth = extractAfter(pth,2);
    end

    % Normalize accidental double slashes
    pth = replace(pth,"//","/");

    clean_path(i) = pth;
end

%% Keep unique path + line combinations

if isempty(clean_path)
    linkTable = table(strings(0,1), zeros(0,1), strings(0,1), false(0,1), strings(0,1), ...
        'VariableNames', {'path','source_line','source_type','exists','status'});
else
    key = clean_path + "::" + string(source_line) + "::" + source_type;
    [~, idx] = unique(key, "stable");

    clean_path = clean_path(idx);
    source_line = source_line(idx);
    source_type = source_type(idx);

    existsFlag = false(numel(clean_path),1);
    status = strings(numel(clean_path),1);

    for i = 1:numel(clean_path)
        pth = clean_path(i);

        if isfile(pth) || isfolder(pth)
            existsFlag(i) = true;
            status(i) = "OK";
        else
            existsFlag(i) = false;
            status(i) = "MISSING";
        end
    end

    linkTable = table(clean_path, source_line, source_type, existsFlag, status);
    linkTable.Properties.VariableNames = {'path','source_line','source_type','exists','status'};
end

writetable(linkTable, "results/final_readme_link_check.csv")

missingLinks = linkTable(linkTable.exists == false, :);

%% Create README link-check documentation

doc = strings(0,1);

doc(end+1,1) = "# Final README Link Check";
doc(end+1,1) = "";
doc(end+1,1) = "## Purpose";
doc(end+1,1) = "";
doc(end+1,1) = "This document summarizes the final README path and link check for the UrbanEV-BBW-RFLP-Verification project.";
doc(end+1,1) = "";
doc(end+1,1) = "The check extracts path-like items from backticks and relative Markdown links in `README.md` and verifies whether the referenced files exist in the repository.";
doc(end+1,1) = "";
doc(end+1,1) = "## Summary";
doc(end+1,1) = "";
doc(end+1,1) = "| Metric | Value |";
doc(end+1,1) = "|---|---|";
doc(end+1,1) = "| README path references checked | " + string(height(linkTable)) + " |";
doc(end+1,1) = "| Existing references | " + string(sum(linkTable.exists == true)) + " |";
doc(end+1,1) = "| Missing references | " + string(height(missingLinks)) + " |";
doc(end+1,1) = "";

if height(missingLinks) == 0
    doc(end+1,1) = "README link-check result: all detected local README references exist.";
else
    doc(end+1,1) = "README link-check result: some README references are missing and should be corrected.";
end

doc(end+1,1) = "";
doc(end+1,1) = "## Missing README References";
doc(end+1,1) = "";

if height(missingLinks) == 0
    doc(end+1,1) = "No missing README references were detected.";
else
    doc(end+1,1) = "| Path | README line | Source type |";
    doc(end+1,1) = "|---|---:|---|";

    for i = 1:height(missingLinks)
        doc(end+1,1) = "| `" + missingLinks.path(i) + "` | " + string(missingLinks.source_line(i)) + " | " + missingLinks.source_type(i) + " |";
    end
end

doc(end+1,1) = "";
doc(end+1,1) = "## Machine-Readable File";
doc(end+1,1) = "";
doc(end+1,1) = "- `results/final_readme_link_check.csv`";

writelines(doc, "docs/48_final_readme_link_check.md")

%% Final print

disp("Final README polish and link check completed.")
disp("README path references checked: " + string(height(linkTable)))
disp("Missing README references: " + string(height(missingLinks)))

if height(missingLinks) > 0
    disp("Missing README references:")
    disp(missingLinks)
else
    disp("All detected local README references exist.")
end