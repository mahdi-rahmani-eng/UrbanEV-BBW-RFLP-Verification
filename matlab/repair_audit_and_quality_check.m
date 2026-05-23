%% repair_final_audit_simple.m
% Clean final audit + repository quality check
% This script overwrites the wrong old audit with a real file-based audit.

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

%% Move loose build scripts from root to matlab folder
buildFiles = dir("build_*.m");

for i = 1:numel(buildFiles)
    src = string(buildFiles(i).name);
    dst = fullfile("matlab", src);

    if isfile(src)
        copyfile(src, dst, "f")
        delete(src)
        disp("Moved to matlab/: " + src)
    end
end

%% ============================================================
% 1) Correct course-alignment audit
%% ============================================================

rows = {
    'CA-01', 'Project overview, need, mission, and scope', 'README.md'
    'CA-02', 'Requirements definition', 'data/requirements.csv'
    'CA-03', 'Scenario definition', 'data/scenarios.csv'
    'CA-04', 'Black Box system context', 'figures/system_context_diagram.png'
    'CA-05', 'Black Box external interface definition', 'figures/external_interface_diagram.png'
    'CA-06', 'Black Box services / use-case definition', 'figures/services_use_case_diagram.png'
    'CA-07', 'Operating modes / warning-state logic', 'figures/operating_modes_diagram.png'
    'CA-08', 'Lifecycle / workflow representation', 'figures/lifecycle_diagram.png'
    'CA-09', 'Concept generation summary', 'figures/concept_generation_summary.png'
    'CA-10', 'Concept screening matrix', 'figures/actuator_concept_screening_matrix.png'
    'CA-11', 'Concept scoring matrix', 'figures/actuator_concept_scoring_matrix.png'
    'CA-12', 'White Box functional decomposition', 'data/white_box_functional_decomposition.csv; figures/white_box_functional_decomposition.png'
    'CA-13', 'White Box logical architecture', 'data/white_box_logical_architecture.csv; figures/white_box_logical_architecture.png'
    'CA-14', 'White Box physical allocation', 'data/white_box_physical_allocation.csv; figures/white_box_physical_allocation.png'
    'CA-15', 'White Box traceability chain', 'data/white_box_traceability_matrix.csv; figures/white_box_traceability_chain.png'
    'CA-16', 'MATLAB / Simulink implementation evidence', 'models/urban_ev_bbw_warning_logic_test_validation.slx'
    'CA-17', 'Simulink Test Manager evidence', 'UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx'
    'CA-18', 'Scenario-based result evidence', 'results/simulink_test_validation_results.csv'
    'CA-19', 'Requirement-to-test traceability result', 'results/simulink_requirement_test_traceability.csv'
    'CA-20', 'Final presentation slide plan', 'docs/25_final_presentation_slide_plan.md'
    'CA-21', 'Final presentation speaker script', 'docs/26_final_presentation_speaker_script.md'
    'CA-22', 'Final presentation Q&A support', 'docs/29_final_presentation_q_and_a.md'
};

n = size(rows,1);

item_id = strings(n,1);
course_mandatory_item = strings(n,1);
evidence_file = strings(n,1);
exists_flag = false(n,1);
current_status = strings(n,1);
missing_evidence = strings(n,1);
action_needed = strings(n,1);

for i = 1:n
    item_id(i) = string(rows{i,1});
    course_mandatory_item(i) = string(rows{i,2});
    evidence_file(i) = string(rows{i,3});

    fileList = split(evidence_file(i), ";");
    fileList = strtrim(fileList);

    missingList = strings(0,1);

    for j = 1:numel(fileList)
        f = fileList(j);

        if ~(isfile(f) || isfolder(f))
            missingList(end+1,1) = f;
        end
    end

    if isempty(missingList)
        exists_flag(i) = true;
        current_status(i) = "Closed";
        missing_evidence(i) = "None";
        action_needed(i) = "No action needed.";
    else
        exists_flag(i) = false;
        current_status(i) = "Needs attention";
        missing_evidence(i) = strjoin(missingList, "; ");
        action_needed(i) = "Create, restore, or correct the referenced evidence file.";
    end
end

auditTable = table( ...
    item_id, ...
    course_mandatory_item, ...
    evidence_file, ...
    exists_flag, ...
    current_status, ...
    missing_evidence, ...
    action_needed);

auditTable.Properties.VariableNames = { ...
    'item_id', ...
    'course_mandatory_item', ...
    'evidence_file', ...
    'exists', ...
    'current_status', ...
    'missing_evidence', ...
    'action_needed'};

writetable(auditTable, "results/mandatory_content_gap_closure_matrix.csv")

closedCount = sum(exists_flag);
missingCount = n - closedCount;

%% Create audit markdown document

doc = strings(0,1);

doc(end+1,1) = "# Final Course Alignment and Mandatory Content Audit";
doc(end+1,1) = "";
doc(end+1,1) = "## Audit Summary";
doc(end+1,1) = "";
doc(end+1,1) = "| Metric | Value |";
doc(end+1,1) = "|---|---|";
doc(end+1,1) = "| Total checked items | " + string(n) + " |";
doc(end+1,1) = "| Closed items | " + string(closedCount) + " |";
doc(end+1,1) = "| Items needing attention | " + string(missingCount) + " |";
doc(end+1,1) = "";

if missingCount == 0
    doc(end+1,1) = "Audit result: all mandatory course-alignment items are closed.";
else
    doc(end+1,1) = "Audit result: some items still need attention before final submission.";
end

doc(end+1,1) = "";
doc(end+1,1) = "## Detailed Audit Table";
doc(end+1,1) = "";
doc(end+1,1) = "| ID | Mandatory item | Evidence | Status | Missing evidence |";
doc(end+1,1) = "|---|---|---|---|---|";

for i = 1:n
    doc(end+1,1) = "| " + item_id(i) + ...
        " | " + course_mandatory_item(i) + ...
        " | `" + evidence_file(i) + "`" + ...
        " | " + current_status(i) + ...
        " | " + missing_evidence(i) + " |";
end

doc(end+1,1) = "";
doc(end+1,1) = "## Scope Note";
doc(end+1,1) = "";
doc(end+1,1) = "This audit checks university-level project evidence only. It does not claim industrial completeness, ISO 26262 validation, SOTIF validation, HIL/SIL testing, or production brake-by-wire design.";

writelines(doc, "docs/45_final_course_alignment_audit.md")

disp("Correct audit created.")
disp("Closed items: " + string(closedCount) + " / " + string(n))
disp("Items needing attention: " + string(missingCount))

if missingCount > 0
    disp("Missing audit items:")
    disp(auditTable(auditTable.exists == false, ["item_id","course_mandatory_item","missing_evidence"]))
end

%% ============================================================
% 2) Final repository quality check
%% ============================================================

requiredItems = [
    "README.md"
    ".gitignore"
    "data/requirements.csv"
    "data/scenarios.csv"
    "data/white_box_functional_decomposition.csv"
    "data/white_box_logical_architecture.csv"
    "data/white_box_physical_allocation.csv"
    "data/white_box_function_to_simulink_mapping.csv"
    "data/white_box_traceability_matrix.csv"
    "figures/system_context_diagram.png"
    "figures/external_interface_diagram.png"
    "figures/services_use_case_diagram.png"
    "figures/operating_modes_diagram.png"
    "figures/lifecycle_diagram.png"
    "figures/concept_generation_summary.png"
    "figures/actuator_concept_screening_matrix.png"
    "figures/actuator_concept_scoring_matrix.png"
    "figures/white_box_functional_decomposition.png"
    "figures/white_box_logical_architecture.png"
    "figures/white_box_physical_allocation.png"
    "figures/white_box_traceability_chain.png"
    "models/urban_ev_bbw_warning_logic_test_validation.slx"
    "UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx"
    "results/simulink_test_validation_results.csv"
    "results/simulink_requirement_test_traceability.csv"
    "results/mandatory_content_gap_closure_matrix.csv"
    "docs/42_concept_generation_screening_scoring_figures.md"
    "docs/43_white_box_decomposition_package.md"
    "docs/44_white_box_presentation_figures.md"
    "docs/45_final_course_alignment_audit.md"
];

m = numel(requiredItems);

path = strings(m,1);
category = strings(m,1);
exists_repo = false(m,1);
status = strings(m,1);
action_needed_repo = strings(m,1);

for i = 1:m
    path(i) = requiredItems(i);

    if startsWith(path(i),"data/")
        category(i) = "Data";
    elseif startsWith(path(i),"figures/")
        category(i) = "Figure";
    elseif startsWith(path(i),"models/")
        category(i) = "Simulink model";
    elseif startsWith(path(i),"results/")
        category(i) = "Result";
    elseif startsWith(path(i),"docs/")
        category(i) = "Documentation";
    elseif endsWith(path(i),".mldatx")
        category(i) = "Test Manager";
    else
        category(i) = "Root";
    end

    if isfile(path(i)) || isfolder(path(i))
        exists_repo(i) = true;
        status(i) = "OK";
        action_needed_repo(i) = "No action needed.";
    else
        exists_repo(i) = false;
        status(i) = "MISSING";
        action_needed_repo(i) = "Create, restore, or correct this path.";
    end
end

qualityTable = table(path, category, exists_repo, status, action_needed_repo);

qualityTable.Properties.VariableNames = { ...
    'path', ...
    'category', ...
    'exists', ...
    'status', ...
    'action_needed'};

writetable(qualityTable, "results/final_repository_quality_check.csv")

okCount = sum(exists_repo);
repoMissingCount = m - okCount;

%% Create quality markdown document

qdoc = strings(0,1);

qdoc(end+1,1) = "# Final Repository Quality Check";
qdoc(end+1,1) = "";
qdoc(end+1,1) = "## Summary";
qdoc(end+1,1) = "";
qdoc(end+1,1) = "| Metric | Value |";
qdoc(end+1,1) = "|---|---|";
qdoc(end+1,1) = "| Total required items checked | " + string(m) + " |";
qdoc(end+1,1) = "| Existing items | " + string(okCount) + " |";
qdoc(end+1,1) = "| Missing items | " + string(repoMissingCount) + " |";
qdoc(end+1,1) = "";

if repoMissingCount == 0
    qdoc(end+1,1) = "Repository quality result: all required project evidence files were found.";
else
    qdoc(end+1,1) = "Repository quality result: some required files are missing and need attention.";
end

qdoc(end+1,1) = "";
qdoc(end+1,1) = "## Detailed File Check";
qdoc(end+1,1) = "";
qdoc(end+1,1) = "| Path | Category | Status |";
qdoc(end+1,1) = "|---|---|---|";

for i = 1:m
    qdoc(end+1,1) = "| `" + path(i) + "` | " + category(i) + " | " + status(i) + " |";
end

qdoc(end+1,1) = "";
qdoc(end+1,1) = "## Scope Note";
qdoc(end+1,1) = "";
qdoc(end+1,1) = "This quality check verifies the presence and organization of university-level project evidence. It does not certify industrial completeness, safety compliance, production brake-by-wire design, HIL/SIL validation, or formal automotive qualification.";

writelines(qdoc, "docs/46_final_repository_quality_check.md")

disp("Repository quality check created.")
disp("Existing items: " + string(okCount) + " / " + string(m))
disp("Missing items: " + string(repoMissingCount))

if repoMissingCount > 0
    disp("Missing repository items:")
    disp(qualityTable(qualityTable.exists == false, ["path","category","action_needed"]))
else
    disp("All required repository quality-check items are present.")
end