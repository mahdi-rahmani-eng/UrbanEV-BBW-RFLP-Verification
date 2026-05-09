%% coverage_analysis.m
% Lightweight requirement and ODD coverage analysis.
% This script calculates simple coverage metrics from CSV-based traceability and ODD files.
% It is intended for university-level concept verification, not industrial certification.

clear; clc;

root = fileparts(fileparts(mfilename('fullpath')));
dataFolder = fullfile(root, 'data');
resultsFolder = fullfile(root, 'results');
figFolder = fullfile(root, 'figures');

if ~exist(resultsFolder, 'dir')
    mkdir(resultsFolder);
end

if ~exist(figFolder, 'dir')
    mkdir(figFolder);
end

%% Requirement coverage analysis
traceFile = fullfile(dataFolder, 'traceability_links.csv');

if ~isfile(traceFile)
    error('traceability_links.csv not found.');
end

TL = readtable(traceFile, 'TextType', 'string');

% Requirement IDs are collected from source and target IDs.
allIDs = [TL.source_id; TL.target_id];
reqIDs = unique(allIDs(startsWith(allIDs, 'REQ-')));

numReq = numel(reqIDs);
hasFunctionLink = false(numReq,1);
hasVerificationLink = false(numReq,1);
coverage_status = strings(numReq,1);
coverage_comment = strings(numReq,1);

for i = 1:numReq
    req = reqIDs(i);

    hasFunctionLink(i) = any(TL.source_id == req & TL.target_type == 'function');
    hasVerificationLink(i) = any(TL.source_id == req & TL.link_type == 'verified_by');

    if hasFunctionLink(i) && hasVerificationLink(i)
        coverage_status(i) = 'Complete';
        coverage_comment(i) = 'Requirement is linked to function and verification item.';
    elseif hasFunctionLink(i) || hasVerificationLink(i)
        coverage_status(i) = 'Partial';
        coverage_comment(i) = 'Requirement has only partial traceability or verification coverage.';
    else
        coverage_status(i) = 'Not covered';
        coverage_comment(i) = 'Requirement has no detected function or verification link.';
    end
end

ReqCoverage = table(reqIDs, hasFunctionLink, hasVerificationLink, coverage_status, coverage_comment);
ReqCoverage.Properties.VariableNames = {'requirement_id','has_function_link','has_verification_link','coverage_status','coverage_comment'};

reqOutFile = fullfile(resultsFolder, 'requirement_coverage_results.csv');
writetable(ReqCoverage, reqOutFile);

numComplete = sum(coverage_status == 'Complete');
numPartial = sum(coverage_status == 'Partial');
numNotCovered = sum(coverage_status == 'Not covered');
coveragePercent = 100 * numComplete / max(numReq,1);

fprintf('Requirement coverage analysis completed.\n');
fprintf('Total requirements detected: %d\n', numReq);
fprintf('Complete: %d\n', numComplete);
fprintf('Partial: %d\n', numPartial);
fprintf('Not covered: %d\n', numNotCovered);
fprintf('Complete coverage: %.2f %%\n', coveragePercent);
fprintf('Saved to: %s\n', reqOutFile);

figure;
bar([numComplete numPartial numNotCovered]);
set(gca, 'XTickLabel', {'Complete','Partial','Not covered'});
ylabel('Number of Requirements');
title('Requirement Verification Coverage');
grid on;
figReq = fullfile(figFolder, 'verification_coverage_chart.png');
saveas(gcf, figReq);
fprintf('Saved figure to: %s\n', figReq);

%% ODD coverage analysis
oddFile = fullfile(dataFolder, 'odd_definition.csv');

if ~isfile(oddFile)
    error('odd_definition.csv not found.');
end

ODD = readtable(oddFile, 'TextType', 'string');

odd_id = ODD.odd_id;
category = ODD.category;
attribute = ODD.attribute;
supported_value = ODD.supported_value;
status = ODD.status;
verification_use = ODD.verification_use;
scope_note = ODD.scope_note;

coverage_class = strings(height(ODD),1);
for i = 1:height(ODD)
    if status(i) == 'in_scope'
        coverage_class(i) = 'Covered within defined ODD';
    else
        coverage_class(i) = 'Out of scope / not covered';
    end
end

ODDCoverage = table(odd_id, category, attribute, supported_value, status, coverage_class, verification_use, scope_note);

oddOutFile = fullfile(resultsFolder, 'odd_coverage_results.csv');
writetable(ODDCoverage, oddOutFile);

numInScope = sum(status == 'in_scope');
numOutScope = sum(status == 'out_of_scope');
oddCoveragePercent = 100 * numInScope / max(height(ODD),1);

fprintf('\nODD coverage analysis completed.\n');
fprintf('Total ODD entries: %d\n', height(ODD));
fprintf('In scope: %d\n', numInScope);
fprintf('Out of scope: %d\n', numOutScope);
fprintf('In-scope ODD coverage: %.2f %%\n', oddCoveragePercent);
fprintf('Saved to: %s\n', oddOutFile);

figure;
bar([numInScope numOutScope]);
set(gca, 'XTickLabel', {'In scope','Out of scope'});
ylabel('Number of ODD Entries');
title('ODD Coverage Summary');
grid on;
figOdd = fullfile(figFolder, 'odd_coverage_chart.png');
saveas(gcf, figOdd);
fprintf('Saved figure to: %s\n', figOdd);
