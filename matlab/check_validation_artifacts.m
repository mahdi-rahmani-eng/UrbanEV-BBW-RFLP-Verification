% CHECK_VALIDATION_ARTIFACTS
% Checks whether the main validation artifacts exist in the repository.
% This script is robust to being executed from different MATLAB folders.

clc;

% Detect project root from this script location
scriptPath = mfilename("fullpath");
scriptFolder = fileparts(scriptPath);
projectRoot = fileparts(scriptFolder);

cd(projectRoot);

requiredFiles = [
    "README.md"
    "models/urban_ev_bbw_warning_logic_test_validation.slx"
    "models/urban_ev_bbw_warning_logic_stateflow_validation.slx"
    "UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx"
    "docs/00_validation_artifacts_index.md"
    "docs/28_stateflow_warning_logic.md"
    "docs/30_validation_evidence_summary.md"
    "docs/31_future_industrial_extension_roadmap.md"
    "docs/32_can_signal_mapping.md"
    "docs/33_extended_odd_scenario_library.md"
    "docs/34_odd_coverage_summary.md"
    "docs/35_regression_test_plan.md"
    "data/automotive_signal_interface.csv"
    "data/can_signal_mapping.csv"
    "data/extended_odd_scenario_library.csv"
    "data/odd_coverage_summary.csv"
    "data/regression_test_plan.csv"
    "data/requirement_test_result_matrix.csv"
];

Exists = false(numel(requiredFiles),1);

for i = 1:numel(requiredFiles)
    Exists(i) = isfile(fullfile(projectRoot, requiredFiles(i)));
end

Status = strings(numel(requiredFiles),1);
Status(Exists) = "Available";
Status(~Exists) = "Missing";

T = table(requiredFiles, Status, 'VariableNames', {'ArtifactFile','Status'});

disp("Validation artifact check summary:")
disp(T)

if ~isfolder(fullfile(projectRoot,"results"))
    mkdir(fullfile(projectRoot,"results"));
end

writetable(T, fullfile(projectRoot,"results","validation_artifacts_check.csv"));

if all(Exists)
    disp("All required validation artifacts are available.")
else
    warning("Some validation artifacts are missing. Check results/validation_artifacts_check.csv")
end