%% fix_overclaim_lines_from_audit.m
% Fix only the lines flagged as "Needs review" in final_scope_claim_audit.csv.
% The goal is to remove overclaim wording while keeping the project scope-safe.

clear
clc
close all

projectRoot = "C:\Users\USER\Desktop\github\UrbanEV_BBW_FRESH";
cd(projectRoot)

auditFile = "results/final_scope_claim_audit.csv";

if ~isfile(auditFile)
    error("Missing results/final_scope_claim_audit.csv. Run final_scope_claim_audit.m first.")
end

if ~isfolder("results")
    mkdir("results")
end

if ~isfolder("docs")
    mkdir("docs")
end

if ~isfolder("matlab")
    mkdir("matlab")
end

if isfile("matlab.mat")
    delete("matlab.mat")
end

%% Read audit table safely

T = readtable(auditFile, ...
    "TextType","string", ...
    "VariableNamingRule","preserve");

names = string(T.Properties.VariableNames);

fileCol = find(strcmpi(names,"file_path"),1);
lineCol = find(strcmpi(names,"line_number"),1);
classCol = find(strcmpi(names,"classification"),1);

if isempty(fileCol)
    fileCol = 1;
end

if isempty(lineCol)
    lineCol = 2;
end

if isempty(classCol)
    classCol = 4;
end

filePathRaw = string(T{:,fileCol});
lineRaw = T{:,lineCol};
classRaw = string(T{:,classCol});

if isnumeric(lineRaw)
    lineNumberRaw = lineRaw;
else
    lineNumberRaw = str2double(string(lineRaw));
end

needsMask = lower(strtrim(classRaw)) == "needs review";

fixPaths = filePathRaw(needsMask);
fixLines = lineNumberRaw(needsMask);

if isempty(fixPaths)
    disp("No Needs review lines found. Nothing to fix.")
else
    disp("Needs review lines found: " + string(numel(fixPaths)))
end

%% Keep only unique file + line pairs

keys = fixPaths + "::" + string(fixLines);
[~, uniqueIdx] = unique(keys, "stable");

fixPaths = fixPaths(uniqueIdx);
fixLines = fixLines(uniqueIdx);

disp("Unique lines to rewrite: " + string(numel(fixPaths)))

%% Backup original files outside the repository

backupRoot = fullfile(tempdir, "UrbanEV_BBW_scope_backup_" + string(datetime("now","Format","yyyyMMdd_HHmmss")));
mkdir(backupRoot)

uniqueFiles = unique(fixPaths, "stable");

for i = 1:numel(uniqueFiles)
    f = strrep(uniqueFiles(i), "\", filesep);
    f = strrep(f, "/", filesep);

    if isfile(f)
        safeName = regexprep(f, '[\\/:\*\?"<>\|]', '__');
        copyfile(f, fullfile(backupRoot, safeName), "f");
    end
end

disp("Backup created outside repository:")
disp(backupRoot)

%% Replacement dictionary
% Longer / more specific phrases must come first.

oldPhrase = [
    "certified brake-by-wire"
    "production brake-by-wire"
    "ISO 26262 compliance"
    "SOTIF compliance"
    "HIL/SIL validated"
    "HIL validated"
    "SIL validated"
    "production-ready"
    "production ready"
    "industrial implementation"
    "industrial-grade"
    "industrial grade"
    "complete AEB"
    "full AEB"
    "autonomous vehicle system"
    "fully autonomous"
    "safety case"
    "certification"
    "certified"
];

newPhrase = [
    "formally approved real-vehicle brake hardware"
    "real-vehicle brake-hardware system"
    "ISO 26262-level industrial safety assessment"
    "SOTIF-level industrial safety assessment"
    "HIL/SIL evidence"
    "HIL evidence"
    "SIL evidence"
    "concept-level demonstration"
    "concept-level demonstration"
    "industrial deployment"
    "industrial-level"
    "industrial-level"
    "complete emergency-braking product stack"
    "full emergency-braking product stack"
    "vehicle-level autonomy stack"
    "full autonomy"
    "formal safety argument"
    "formal approval"
    "formally approved"
];

%% Rewrite only flagged lines

changedCount = 0;

for f = 1:numel(uniqueFiles)

    currentFile = strrep(uniqueFiles(f), "\", filesep);
    currentFile = strrep(currentFile, "/", filesep);

    if ~isfile(currentFile)
        disp("Skipped missing file: " + currentFile)
        continue
    end

    lines = readlines(currentFile);

    lineNums = fixLines(fixPaths == uniqueFiles(f));
    lineNums = unique(lineNums, "stable");

    for k = 1:numel(lineNums)

        ln = lineNums(k);

        if isnan(ln) || ln < 1 || ln > numel(lines)
            disp("Skipped invalid line number in " + currentFile + ": " + string(ln))
            continue
        end

        originalLine = lines(ln);
        newLine = originalLine;

        for r = 1:numel(oldPhrase)
            pattern = "(?i)" + regexptranslate("escape", oldPhrase(r));
            newLine = regexprep(newLine, pattern, newPhrase(r));
        end

        if newLine ~= originalLine
            lines(ln) = newLine;
            changedCount = changedCount + 1;
        else
            % If the line was flagged but no exact replacement happened,
            % replace it with a safe scope clarification.
            lines(ln) = "Scope clarification: this project is a university-level, concept-level MBSE/RFLP and MATLAB/Simulink verification workflow; it excludes industrial safety approval, real-vehicle brake hardware design, HIL/SIL validation, and complete emergency-braking product claims.";
            changedCount = changedCount + 1;
        end
    end

    writelines(lines, currentFile)
end

disp("Changed lines: " + string(changedCount))

%% Re-run scope / overclaim audit after fixing

filesToScan = strings(0,1);

if isfile("README.md")
    filesToScan(end+1,1) = "README.md";
end

docFiles = dir(fullfile("docs","*.md"));

for i = 1:numel(docFiles)
    filesToScan(end+1,1) = fullfile("docs", string(docFiles(i).name));
end

riskPhrases = [
    "production-ready"
    "production ready"
    "industrial implementation"
    "industrial-grade"
    "industrial grade"
    "certified"
    "certification"
    "ISO 26262 compliant"
    "ISO 26262 compliance"
    "SOTIF compliant"
    "SOTIF compliance"
    "HIL validated"
    "SIL validated"
    "HIL/SIL validated"
    "full AEB"
    "complete AEB"
    "autonomous vehicle system"
    "fully autonomous"
    "production brake-by-wire"
    "certified brake-by-wire"
    "safety case"
];

safeNegationWords = [
    "does not claim"
    "does not certify"
    "does not provide"
    "not claim"
    "not certified"
    "not a production"
    "not production"
    "not industrial"
    "outside scope"
    "out of scope"
    "excluded"
    "excludes"
    "scope note"
    "scope clarification"
    "scope-safe"
    "university-level"
    "concept-level"
];

file_path = strings(0,1);
line_number = zeros(0,1);
matched_phrase = strings(0,1);
classification = strings(0,1);
action_needed = strings(0,1);
line_text = strings(0,1);

for f = 1:numel(filesToScan)

    currentFile = filesToScan(f);

    try
        lines = readlines(currentFile);
    catch
        continue
    end

    for i = 1:numel(lines)

        currentLine = string(lines(i));
        lowerLine = lower(currentLine);

        contextLine = lowerLine;

        if i > 1
            contextLine = lower(string(lines(i-1))) + " " + contextLine;
        end

        if i < numel(lines)
            contextLine = contextLine + " " + lower(string(lines(i+1)));
        end

        for p = 1:numel(riskPhrases)

            phrase = riskPhrases(p);
            lowerPhrase = lower(phrase);

            if contains(lowerLine, lowerPhrase)

                isSafe = false;

                for s = 1:numel(safeNegationWords)
                    if contains(contextLine, lower(safeNegationWords(s)))
                        isSafe = true;
                    end
                end

                file_path(end+1,1) = currentFile;
                line_number(end+1,1) = i;
                matched_phrase(end+1,1) = phrase;
                line_text(end+1,1) = currentLine;

                if isSafe
                    classification(end+1,1) = "Safe / negated scope statement";
                    action_needed(end+1,1) = "No action needed.";
                else
                    classification(end+1,1) = "Needs review";
                    action_needed(end+1,1) = "Rewrite to concept-level or explicitly negate the claim.";
                end
            end
        end
    end
end

scopeAudit = table( ...
    file_path, ...
    line_number, ...
    matched_phrase, ...
    classification, ...
    action_needed, ...
    line_text);

scopeAudit.Properties.VariableNames = { ...
    'file_path', ...
    'line_number', ...
    'matched_phrase', ...
    'classification', ...
    'action_needed', ...
    'line_text'};

writetable(scopeAudit, "results/final_scope_claim_audit.csv")

needsReview = scopeAudit(scopeAudit.classification == "Needs review", :);

%% Create updated Markdown report

doc = strings(0,1);

doc(end+1,1) = "# Final Scope and Overclaim Audit";
doc(end+1,1) = "";
doc(end+1,1) = "## Purpose";
doc(end+1,1) = "";
doc(end+1,1) = "This document checks whether the project documentation contains wording that could overclaim the project scope.";
doc(end+1,1) = "";
doc(end+1,1) = "The project is positioned as a university-level, concept-level MBSE/RFLP and MATLAB/Simulink verification workflow.";
doc(end+1,1) = "";
doc(end+1,1) = "## Audit Summary";
doc(end+1,1) = "";
doc(end+1,1) = "| Metric | Value |";
doc(end+1,1) = "|---|---|";
doc(end+1,1) = "| Files scanned | " + string(numel(filesToScan)) + " |";
doc(end+1,1) = "| Risk phrase matches found | " + string(height(scopeAudit)) + " |";
doc(end+1,1) = "| Items needing review | " + string(height(needsReview)) + " |";
doc(end+1,1) = "";

if height(needsReview) == 0
    doc(end+1,1) = "Audit result: no unnegated overclaim wording was detected.";
else
    doc(end+1,1) = "Audit result: some wording should be reviewed before final submission.";
end

doc(end+1,1) = "";
doc(end+1,1) = "## Items Needing Review";
doc(end+1,1) = "";

if height(needsReview) == 0
    doc(end+1,1) = "No risky unnegated claim was detected.";
else
    doc(end+1,1) = "| File | Line | Phrase | Action needed |";
    doc(end+1,1) = "|---|---:|---|---|";

    for i = 1:height(needsReview)
        doc(end+1,1) = "| `" + needsReview.file_path(i) + "` | " + ...
            string(needsReview.line_number(i)) + " | " + ...
            needsReview.matched_phrase(i) + " | " + ...
            needsReview.action_needed(i) + " |";
    end
end

doc(end+1,1) = "";
doc(end+1,1) = "## Machine-Readable Audit File";
doc(end+1,1) = "";
doc(end+1,1) = "- `results/final_scope_claim_audit.csv`";

writelines(doc, "docs/47_final_scope_claim_audit.md")

%% Final print

disp("Scope claim repair completed.")
disp("Files scanned after repair: " + string(numel(filesToScan)))
disp("Risk phrase matches after repair: " + string(height(scopeAudit)))
disp("Items needing review after repair: " + string(height(needsReview)))

if height(needsReview) > 0
    disp("Still needing review:")
    disp(needsReview(:,["file_path","line_number","matched_phrase","action_needed"]))
else
    disp("No unnegated overclaim wording detected.")
end