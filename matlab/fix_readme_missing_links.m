%% fix_readme_missing_links.m
% Fix the 4 missing README references and rebuild README link check.

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
% 1) Create missing docs/37_final_live_demo_sequence.md
%% ------------------------------------------------------------

liveDemoDoc = strings(0,1);

liveDemoDoc(end+1,1) = "# Final Live Demo Sequence";
liveDemoDoc(end+1,1) = "";
liveDemoDoc(end+1,1) = "## Purpose";
liveDemoDoc(end+1,1) = "";
liveDemoDoc(end+1,1) = "This document provides a short live-demo sequence for presenting the UrbanEV-BBW-RFLP-Verification project during the final course discussion.";
liveDemoDoc(end+1,1) = "";
liveDemoDoc(end+1,1) = "The demo is designed to show the project evidence in a clear order: project scope, Black Box definition, concept selection, White Box decomposition, Simulink verification, results, and final audit evidence.";
liveDemoDoc(end+1,1) = "";
liveDemoDoc(end+1,1) = "## Recommended Demo Order";
liveDemoDoc(end+1,1) = "";
liveDemoDoc(end+1,1) = "| Step | What to show | Main file or folder | Purpose |";
liveDemoDoc(end+1,1) = "|---|---|---|---|";
liveDemoDoc(end+1,1) = "| 1 | Repository overview | `README.md` | Introduce the project scope and scope-safe positioning. |";
liveDemoDoc(end+1,1) = "| 2 | Requirements and scenarios | `data/requirements.csv`, `data/scenarios.csv` | Show the input evidence for the verification workflow. |";
liveDemoDoc(end+1,1) = "| 3 | Black Box evidence | `figures/system_context_diagram.png`, `figures/external_interface_diagram.png`, `figures/services_use_case_diagram.png` | Show the external system definition. |";
liveDemoDoc(end+1,1) = "| 4 | Concept selection | `figures/concept_generation_summary.png`, `figures/actuator_concept_screening_matrix.png`, `figures/actuator_concept_scoring_matrix.png` | Show how the actuator concept was selected. |";
liveDemoDoc(end+1,1) = "| 5 | White Box decomposition | `figures/white_box_functional_decomposition.png`, `figures/white_box_logical_architecture.png`, `figures/white_box_physical_allocation.png`, `figures/white_box_traceability_chain.png` | Show the internal system decomposition. |";
liveDemoDoc(end+1,1) = "| 6 | Simulink model | `models/urban_ev_bbw_warning_logic_test_validation.slx` | Show the concept-level implementation evidence. |";
liveDemoDoc(end+1,1) = "| 7 | Test Manager evidence | `UrbanEV_BBW_All_Scenarios_Test_Manager_v2.mldatx` | Show the scenario-based verification asset. |";
liveDemoDoc(end+1,1) = "| 8 | Results | `results/simulink_test_validation_results.csv`, `results/simulink_requirement_test_traceability.csv` | Show verification output and traceability evidence. |";
liveDemoDoc(end+1,1) = "| 9 | Final audits | `docs/45_final_course_alignment_audit.md`, `docs/46_final_repository_quality_check.md`, `docs/47_final_scope_claim_audit.md`, `docs/48_final_readme_link_check.md` | Show final readiness and consistency checks. |";
liveDemoDoc(end+1,1) = "";
liveDemoDoc(end+1,1) = "## Scope-Safe Demo Statement";
liveDemoDoc(end+1,1) = "";
liveDemoDoc(end+1,1) = "This demo presents a university-level, concept-level MBSE/RFLP and MATLAB/Simulink verification workflow. It does not claim industrial completeness, production brake-by-wire design, HIL/SIL validation, ISO 26262 validation, SOTIF validation, or certified safety compliance.";

writelines(liveDemoDoc, "docs/37_final_live_demo_sequence.md")
disp("Created: docs/37_final_live_demo_sequence.md")


%% ------------------------------------------------------------
% 2) Create missing matlab/build_white_box_physical_allocation_final.m
%% ------------------------------------------------------------

scriptText = strings(0,1);

scriptText(end+1,1) = "%% build_white_box_physical_allocation_final.m";
scriptText(end+1,1) = "% Regenerates the final White Box Physical Allocation figure.";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "clear";
scriptText(end+1,1) = "clc";
scriptText(end+1,1) = "close all";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "cd(""C:\Users\USER\Desktop\github\UrbanEV_BBW_FRESH"")";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "if ~isfolder(""figures"")";
scriptText(end+1,1) = "    mkdir(""figures"")";
scriptText(end+1,1) = "end";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "fontName = ""Arial"";";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "blueEdge   = [0.12 0.38 0.70];";
scriptText(end+1,1) = "blueFill   = [0.91 0.96 1.00];";
scriptText(end+1,1) = "greenEdge  = [0.12 0.48 0.22];";
scriptText(end+1,1) = "greenFill  = [0.90 0.96 0.90];";
scriptText(end+1,1) = "orangeEdge = [0.85 0.42 0.08];";
scriptText(end+1,1) = "orangeFill = [1.00 0.94 0.82];";
scriptText(end+1,1) = "purpleEdge = [0.35 0.22 0.65];";
scriptText(end+1,1) = "purpleFill = [0.94 0.91 0.99];";
scriptText(end+1,1) = "grayEdge   = [0.45 0.45 0.45];";
scriptText(end+1,1) = "grayFill   = [0.96 0.96 0.96];";
scriptText(end+1,1) = "darkText   = [0.08 0.08 0.08];";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "fig = figure(""Color"",""w"",""Units"",""pixels"",""Position"",[100 80 1600 900],""Renderer"",""painters"");";
scriptText(end+1,1) = "set(fig,""InvertHardcopy"",""off"")";
scriptText(end+1,1) = "set(fig,""PaperPositionMode"",""auto"")";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "ax = axes(""Position"",[0 0 1 1]);";
scriptText(end+1,1) = "axis(ax,[0 100 0 100])";
scriptText(end+1,1) = "axis(ax,""off"")";
scriptText(end+1,1) = "hold(ax,""on"")";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "rectangle(ax,""Position"",[0 0 100 100],""FaceColor"",""w"",""EdgeColor"",""w"")";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "text(ax,50,91,""White Box Physical Allocation"",""HorizontalAlignment"",""center"",""VerticalAlignment"",""middle"",""FontName"",fontName,""FontSize"",24,""FontWeight"",""bold"",""Color"",darkText)";
scriptText(end+1,1) = "text(ax,50,86,""Logical blocks are allocated to concept-level physical elements and verification assets"",""HorizontalAlignment"",""center"",""VerticalAlignment"",""middle"",""FontName"",fontName,""FontSize"",13,""Color"",darkText)";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "text(ax,20,76,""Vehicle / Inputs"",""HorizontalAlignment"",""center"",""FontName"",fontName,""FontSize"",13,""FontWeight"",""bold"",""Color"",blueEdge)";
scriptText(end+1,1) = "text(ax,50,76,""Controller Allocation"",""HorizontalAlignment"",""center"",""FontName"",fontName,""FontSize"",13,""FontWeight"",""bold"",""Color"",greenEdge)";
scriptText(end+1,1) = "text(ax,80,76,""Actuation / Verification"",""HorizontalAlignment"",""center"",""FontName"",fontName,""FontSize"",13,""FontWeight"",""bold"",""Color"",orangeEdge)";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "boxW = 22; boxH = 11;";
scriptText(end+1,1) = "xP01 = 9;  yP01 = 59;";
scriptText(end+1,1) = "xP02 = 39; yP02 = 59;";
scriptText(end+1,1) = "xP03 = 69; yP03 = 59;";
scriptText(end+1,1) = "xP04 = 9;  yP04 = 38;";
scriptText(end+1,1) = "xP05 = 39; yP05 = 38;";
scriptText(end+1,1) = "xP06 = 69; yP06 = 38;";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "rectangle(ax,""Position"",[xP01 yP01 boxW boxH],""FaceColor"",blueFill,""EdgeColor"",blueEdge,""LineWidth"",1.8,""Curvature"",0.04)";
scriptText(end+1,1) = "text(ax,xP01+boxW/2,yP01+boxH/2,sprintf(""P-01\nLow-Speed Urban EV\nPlatform Context""),""HorizontalAlignment"",""center"",""VerticalAlignment"",""middle"",""FontName"",fontName,""FontSize"",10.5,""FontWeight"",""bold"",""Color"",darkText)";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "rectangle(ax,""Position"",[xP02 yP02 boxW boxH],""FaceColor"",greenFill,""EdgeColor"",greenEdge,""LineWidth"",2.1,""Curvature"",0.04)";
scriptText(end+1,1) = "text(ax,xP02+boxW/2,yP02+boxH/2,sprintf(""P-02\nConcept-Level\nBBW Controller""),""HorizontalAlignment"",""center"",""VerticalAlignment"",""middle"",""FontName"",fontName,""FontSize"",10.5,""FontWeight"",""bold"",""Color"",darkText)";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "rectangle(ax,""Position"",[xP03 yP03 boxW boxH],""FaceColor"",orangeFill,""EdgeColor"",orangeEdge,""LineWidth"",1.8,""Curvature"",0.04)";
scriptText(end+1,1) = "text(ax,xP03+boxW/2,yP03+boxH/2,sprintf(""P-03\nElectric Linear\nBrake Actuator""),""HorizontalAlignment"",""center"",""VerticalAlignment"",""middle"",""FontName"",fontName,""FontSize"",10.5,""FontWeight"",""bold"",""Color"",darkText)";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "rectangle(ax,""Position"",[xP04 yP04 boxW boxH],""FaceColor"",grayFill,""EdgeColor"",grayEdge,""LineWidth"",1.6,""Curvature"",0.04)";
scriptText(end+1,1) = "text(ax,xP04+boxW/2,yP04+boxH/2,sprintf(""P-04\nEgo-Speed\nSource""),""HorizontalAlignment"",""center"",""VerticalAlignment"",""middle"",""FontName"",fontName,""FontSize"",10.5,""FontWeight"",""bold"",""Color"",darkText)";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "rectangle(ax,""Position"",[xP05 yP05 boxW boxH],""FaceColor"",grayFill,""EdgeColor"",grayEdge,""LineWidth"",1.6,""Curvature"",0.04)";
scriptText(end+1,1) = "text(ax,xP05+boxW/2,yP05+boxH/2,sprintf(""P-05\nForward Target /\nObstacle Assumption""),""HorizontalAlignment"",""center"",""VerticalAlignment"",""middle"",""FontName"",fontName,""FontSize"",10.2,""FontWeight"",""bold"",""Color"",darkText)";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "rectangle(ax,""Position"",[xP06 yP06 boxW boxH],""FaceColor"",purpleFill,""EdgeColor"",purpleEdge,""LineWidth"",1.8,""Curvature"",0.04)";
scriptText(end+1,1) = "text(ax,xP06+boxW/2,yP06+boxH/2,sprintf(""P-06\nMATLAB / Simulink\nVerification Environment""),""HorizontalAlignment"",""center"",""VerticalAlignment"",""middle"",""FontName"",fontName,""FontSize"",10.0,""FontWeight"",""bold"",""Color"",darkText)";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "% Required allocation logic:";
scriptText(end+1,1) = "% P-01 -> P-02, P-04 -> P-02, P-05 -> P-02, P-02 -> P-03, P-02 -> P-06";
scriptText(end+1,1) = "annotation(""arrow"",[(xP01+boxW)/100, xP02/100],[(yP01+boxH/2)/100, (yP02+boxH/2)/100],""Color"",blueEdge,""LineWidth"",1.7,""HeadLength"",9,""HeadWidth"",9)";
scriptText(end+1,1) = "annotation(""arrow"",[(xP02+boxW)/100, xP03/100],[(yP02+boxH/2)/100, (yP03+boxH/2)/100],""Color"",greenEdge,""LineWidth"",1.7,""HeadLength"",9,""HeadWidth"",9)";
scriptText(end+1,1) = "annotation(""arrow"",[(xP04+boxW)/100, xP02/100],[(yP04+boxH/2)/100, (yP02+boxH*0.25)/100],""Color"",grayEdge,""LineWidth"",1.45,""HeadLength"",8,""HeadWidth"",8)";
scriptText(end+1,1) = "annotation(""arrow"",[(xP05+boxW/2)/100, (xP02+boxW/2)/100],[(yP05+boxH)/100, yP02/100],""Color"",grayEdge,""LineWidth"",1.45,""HeadLength"",8,""HeadWidth"",8)";
scriptText(end+1,1) = "annotation(""arrow"",[(xP02+boxW)/100, xP06/100],[(yP02+boxH*0.25)/100, (yP06+boxH/2)/100],""Color"",purpleEdge,""LineWidth"",1.45,""HeadLength"",8,""HeadWidth"",8)";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "rectangle(ax,""Position"",[18 14.5 64 8.5],""FaceColor"",[0.985 0.985 0.985],""EdgeColor"",grayEdge,""LineWidth"",1.2,""Curvature"",0.025)";
scriptText(end+1,1) = "text(ax,50,18.75,sprintf(""Scope note: physical allocation is concept-level only. It identifies candidate system elements;\nit does not claim production hardware design or certified brake-by-wire architecture.""),""HorizontalAlignment"",""center"",""VerticalAlignment"",""middle"",""FontName"",fontName,""FontSize"",10.5,""Color"",darkText)";
scriptText(end+1,1) = "";
scriptText(end+1,1) = "outFile = ""figures/white_box_physical_allocation.png"";";
scriptText(end+1,1) = "exportgraphics(fig,outFile,""Resolution"",350)";
scriptText(end+1,1) = "disp(""Final White Box Physical Allocation figure created successfully."")";
scriptText(end+1,1) = "disp(""Saved to: "" + outFile)";

writelines(scriptText, "matlab/build_white_box_physical_allocation_final.m")
disp("Created: matlab/build_white_box_physical_allocation_final.m")


%% ------------------------------------------------------------
% 3) Rebuild README link-check files AFTER missing files exist
%% ------------------------------------------------------------

readmeFile = "README.md";
readmeLines = readlines(readmeFile);
readmeLines = readmeLines(:);

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

    tickTokens = regexp(line, '`([^`]+)`', 'tokens');

    for t = 1:numel(tickTokens)
        candidate = strtrim(string(tickTokens{t}{1}));
        looksLikePath = contains(candidate,"/") || contains(candidate,"\") || any(endsWith(lower(candidate), lower(knownExtensions)));

        if looksLikePath && ~contains(candidate," ")
            candidates(end+1,1) = candidate;
            source_line(end+1,1) = i;
            source_type(end+1,1) = "backtick";
        end
    end

    linkTokens = regexp(line, '\]\(([^)]+)\)', 'tokens');

    for t = 1:numel(linkTokens)
        candidate = strtrim(string(linkTokens{t}{1}));
        isExternal = startsWith(lower(candidate),"http") || startsWith(lower(candidate),"mailto:") || startsWith(candidate,"#");

        if ~isExternal
            candidates(end+1,1) = candidate;
            source_line(end+1,1) = i;
            source_type(end+1,1) = "markdown_link";
        end
    end
end

clean_path = strings(numel(candidates),1);

for i = 1:numel(candidates)
    pth = candidates(i);
    parts = split(pth, "#");
    pth = parts(1);

    if startsWith(pth,"./")
        pth = extractAfter(pth,2);
    end

    pth = replace(pth,"//","/");
    clean_path(i) = pth;
end

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
        if isfile(clean_path(i)) || isfolder(clean_path(i))
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

disp("README missing references fixed and link check rebuilt.")
disp("README path references checked: " + string(height(linkTable)))
disp("Missing README references: " + string(height(missingLinks)))

if height(missingLinks) > 0
    disp("Still missing:")
    disp(missingLinks)
else
    disp("OK: all detected local README references exist.")
end