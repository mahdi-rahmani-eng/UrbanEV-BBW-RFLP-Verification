%% final_submission_readiness_report.m
% Final submission readiness report for UrbanEV-BBW-RFLP-Verification

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

%% ------------------------------------------------------------
% Helper logic: read each final audit file safely
%% ------------------------------------------------------------

courseAuditFile = "results/mandatory_content_gap_closure_matrix.csv";
qualityFile     = "results/final_repository_quality_check.csv";
scopeFile       = "results/final_scope_claim_audit.csv";
readmeLinkFile  = "results/final_readme_link_check.csv";

%% Course alignment audit
course_total = 0;
course_closed = 0;
course_missing = 999;

if isfile(courseAuditFile)
    T = readtable(courseAuditFile, "TextType","string", "VariableNamingRule","preserve");
    course_total = height(T);

    names = string(T.Properties.VariableNames);
    existsCol = find(strcmpi(names,"exists"),1);

    if isempty(existsCol)
        existsCol = 4;
    end

    existsRaw = T{:,existsCol};

    if islogical(existsRaw)
        existsFlag = existsRaw;
    elseif isnumeric(existsRaw)
        existsFlag = existsRaw ~= 0;
    else
        existsText = lower(strtrim(string(existsRaw)));
        existsFlag = existsText == "true" | existsText == "1" | existsText == "yes";
    end

    course_closed = sum(existsFlag);
    course_missing = course_total - course_closed;
end

%% Repository quality check
quality_total = 0;
quality_existing = 0;
quality_missing = 999;

if isfile(qualityFile)
    Q = readtable(qualityFile, "TextType","string", "VariableNamingRule","preserve");
    quality_total = height(Q);

    names = string(Q.Properties.VariableNames);
    existsCol = find(strcmpi(names,"exists"),1);

    if isempty(existsCol)
        existsCol = 3;
    end

    existsRaw = Q{:,existsCol};

    if islogical(existsRaw)
        existsFlag = existsRaw;
    elseif isnumeric(existsRaw)
        existsFlag = existsRaw ~= 0;
    else
        existsText = lower(strtrim(string(existsRaw)));
        existsFlag = existsText == "true" | existsText == "1" | existsText == "yes";
    end

    quality_existing = sum(existsFlag);
    quality_missing = quality_total - quality_existing;
end

%% Scope / overclaim audit
scope_total_matches = 0;
scope_needs_review = 999;

if isfile(scopeFile)
    S = readtable(scopeFile, "TextType","string", "VariableNamingRule","preserve");
    scope_total_matches = height(S);

    names = string(S.Properties.VariableNames);
    classCol = find(strcmpi(names,"classification"),1);

    if isempty(classCol)
        classCol = 4;
    end

    classification = lower(strtrim(string(S{:,classCol})));
    scope_needs_review = sum(classification == "needs review");
end

%% README link check
readme_total_refs = 0;
readme_missing = 999;

if isfile(readmeLinkFile)
    L = readtable(readmeLinkFile, "TextType","string", "VariableNamingRule","preserve");
    readme_total_refs = height(L);

    names = string(L.Properties.VariableNames);
    existsCol = find(strcmpi(names,"exists"),1);

    if isempty(existsCol)
        existsCol = 4;
    end

    existsRaw = L{:,existsCol};

    if islogical(existsRaw)
        existsFlag = existsRaw;
    elseif isnumeric(existsRaw)
        existsFlag = existsRaw ~= 0;
    else
        existsText = lower(strtrim(string(existsRaw)));
        existsFlag = existsText == "true" | existsText == "1" | existsText == "yes";
    end

    readme_missing = sum(~existsFlag);
end

%% Git status before creating this report
[~, gitStatusText] = system("git status --short");
gitStatusText = string(strtrim(gitStatusText));

if strlength(gitStatusText) == 0
    gitStatusBeforeReport = "Clean before report generation";
else
    gitStatusBeforeReport = "Not clean before report generation";
end

%% Overall readiness
course_ok = course_missing == 0;
quality_ok = quality_missing == 0;
scope_ok = scope_needs_review == 0;
readme_ok = readme_missing == 0;

overall_ready = course_ok && quality_ok && scope_ok && readme_ok;

if overall_ready
    overallStatus = "READY FOR FINAL SUBMISSION / PRESENTATION";
else
    overallStatus = "NEEDS ATTENTION BEFORE FINAL SUBMISSION";
end

%% Summary CSV
check_area = [
    "Course alignment audit"
    "Repository quality check"
    "Scope / overclaim audit"
    "README link check"
];

main_metric = [
    "Missing mandatory items"
    "Missing required repository items"
    "Unnegated overclaim items"
    "Missing README references"
];

value = [
    course_missing
    quality_missing
    scope_needs_review
    readme_missing
];

status = strings(4,1);

for i = 1:4
    if value(i) == 0
        status(i) = "PASS";
    else
        status(i) = "NEEDS ATTENTION";
    end
end

summaryTable = table(check_area, main_metric, value, status);
writetable(summaryTable, "results/final_submission_readiness_summary.csv")

%% Markdown report
doc = strings(0,1);

doc(end+1,1) = "# Final Submission Readiness Report";
doc(end+1,1) = "";
doc(end+1,1) = "## Purpose";
doc(end+1,1) = "";
doc(end+1,1) = "This report summarizes the final readiness status of the UrbanEV-BBW-RFLP-Verification project before final course submission or presentation.";
doc(end+1,1) = "";
doc(end+1,1) = "The report consolidates the final course-alignment audit, repository quality check, scope/overclaim audit, and README link check.";
doc(end+1,1) = "";
doc(end+1,1) = "## Overall Status";
doc(end+1,1) = "";
doc(end+1,1) = "**" + overallStatus + "**";
doc(end+1,1) = "";
doc(end+1,1) = "## Final Readiness Summary";
doc(end+1,1) = "";
doc(end+1,1) = "| Check area | Main metric | Value | Status |";
doc(end+1,1) = "|---|---|---:|---|";

for i = 1:height(summaryTable)
    doc(end+1,1) = "| " + summaryTable.check_area(i) + ...
        " | " + summaryTable.main_metric(i) + ...
        " | " + string(summaryTable.value(i)) + ...
        " | " + summaryTable.status(i) + " |";
end

doc(end+1,1) = "";
doc(end+1,1) = "## Detailed Evidence";
doc(end+1,1) = "";
doc(end+1,1) = "| Evidence area | File |";
doc(end+1,1) = "|---|---|";
doc(end+1,1) = "| Course alignment audit | `docs/45_final_course_alignment_audit.md` |";
doc(end+1,1) = "| Repository quality check | `docs/46_final_repository_quality_check.md` |";
doc(end+1,1) = "| Scope and overclaim audit | `docs/47_final_scope_claim_audit.md` |";
doc(end+1,1) = "| README link check | `docs/48_final_readme_link_check.md` |";
doc(end+1,1) = "| Readiness summary CSV | `results/final_submission_readiness_summary.csv` |";
doc(end+1,1) = "";
doc(end+1,1) = "## Git Status Note";
doc(end+1,1) = "";
doc(end+1,1) = gitStatusBeforeReport + ".";
doc(end+1,1) = "";
doc(end+1,1) = "After generating this report, the report files and this script should be committed and pushed.";
doc(end+1,1) = "";
doc(end+1,1) = "## Scope-Safe Interpretation";
doc(end+1,1) = "";
doc(end+1,1) = "This readiness report confirms that the repository contains the expected university-level project evidence and final review checks. It does not claim industrial completeness, production brake-by-wire design, certified safety compliance, ISO 26262 validation, SOTIF validation, HIL/SIL validation, or real-vehicle deployment readiness.";
doc(end+1,1) = "";

if overall_ready
    doc(end+1,1) = "## Final Conclusion";
    doc(end+1,1) = "";
    doc(end+1,1) = "The project is ready for final course presentation or submission from the perspective of documented evidence, repository organization, README consistency, and scope-safe wording.";
else
    doc(end+1,1) = "## Final Conclusion";
    doc(end+1,1) = "";
    doc(end+1,1) = "Some final checks still require attention before final course presentation or submission.";
end

writelines(doc, "docs/49_final_submission_readiness_report.md")

%% Print result
disp("Final submission readiness report created.")
disp("Overall status: " + overallStatus)
disp("Course missing items: " + string(course_missing))
disp("Repository missing items: " + string(quality_missing))
disp("Scope items needing review: " + string(scope_needs_review))
disp("README missing references: " + string(readme_missing))
disp("Git status before report generation: " + gitStatusBeforeReport)