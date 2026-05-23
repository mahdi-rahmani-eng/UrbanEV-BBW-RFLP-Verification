%% final_scope_claim_audit.m
% Final scope / overclaim audit for UrbanEV-BBW-RFLP-Verification

clear
clc
close all

projectRoot = "C:\Users\USER\Desktop\github\UrbanEV_BBW_FRESH";
cd(projectRoot)

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

%% Files to scan
filesToScan = strings(0,1);

if isfile("README.md")
    filesToScan(end+1,1) = "README.md";
end

docFiles = dir(fullfile("docs","*.md"));

for i = 1:numel(docFiles)
    filesToScan(end+1,1) = fullfile("docs", string(docFiles(i).name));
end

%% Risky phrases to check
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
    "not claim"
    "not certified"
    "not a production"
    "not production"
    "not industrial"
    "not iso"
    "not sotif"
    "scope note"
    "scope-safe"
    "university-level"
    "concept-level"
];

%% Scan
file_path = strings(0,1);
line_number = zeros(0,1);
matched_phrase = strings(0,1);
line_text = strings(0,1);
classification = strings(0,1);
action_needed = strings(0,1);

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

        for p = 1:numel(riskPhrases)

            phrase = riskPhrases(p);
            lowerPhrase = lower(phrase);

            if contains(lowerLine, lowerPhrase)

                isSafe = false;

                for s = 1:numel(safeNegationWords)
                    if contains(lowerLine, lower(safeNegationWords(s)))
                        isSafe = true;
                    end
                end

                file_path(end+1,1) = currentFile;
                line_number(end+1,1) = i;
                matched_phrase(end+1,1) = phrase;
                line_text(end+1,1) = currentLine;

                if isSafe
                    classification(end+1,1) = "Safe / negated scope statement";
                    action_needed(end+1,1) = "No action needed unless wording is unclear.";
                else
                    classification(end+1,1) = "Needs review";
                    action_needed(end+1,1) = "Rewrite to concept-level or explicitly negate the claim.";
                end
            end
        end
    end
end

%% Create result table
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

%% Create Markdown report
doc = strings(0,1);

doc(end+1,1) = "# Final Scope and Overclaim Audit";
doc(end+1,1) = "";
doc(end+1,1) = "## Purpose";
doc(end+1,1) = "";
doc(end+1,1) = "This document checks whether the project documentation contains wording that could overclaim the project scope.";
doc(end+1,1) = "";
doc(end+1,1) = "The project is intentionally positioned as a university-level, concept-level MBSE/RFLP and MATLAB/Simulink verification project. It does not claim industrial completeness, certified safety compliance, ISO 26262 validation, SOTIF validation, HIL/SIL validation, or production brake-by-wire design.";
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

%% Print result
disp("Final scope / overclaim audit created.")
disp("Files scanned: " + string(numel(filesToScan)))
disp("Risk phrase matches found: " + string(height(scopeAudit)))
disp("Items needing review: " + string(height(needsReview)))

if height(needsReview) > 0
    disp("Items needing review:")
    disp(needsReview(:,["file_path","line_number","matched_phrase","action_needed"]))
else
    disp("No unnegated overclaim wording detected.")
end