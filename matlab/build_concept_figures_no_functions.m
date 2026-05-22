%% Build concept figures - polished no-function version

clear
clc
close all
clear functions

cd("C:\Users\USER\Desktop\github\UrbanEV_BBW_FRESH")

if ~isfolder("figures")
    mkdir("figures")
end

if isfile("matlab.mat")
    delete("matlab.mat")
end

set(groot,'defaultTextInterpreter','none')
set(groot,'defaultLegendInterpreter','none')
set(groot,'defaultAxesTickLabelInterpreter','none')

fontName = "Arial";

blue   = [0.12 0.38 0.70];
green  = [0.12 0.48 0.22];
orange = [0.85 0.42 0.08];
red    = [0.72 0.12 0.12];
gray   = [0.42 0.42 0.42];

lightBlue   = [0.90 0.95 0.99];
lightGreen  = [0.90 0.96 0.90];
lightOrange = [1.00 0.93 0.80];
lightRed    = [0.99 0.88 0.88];
lightGray   = [0.95 0.95 0.95];
darkText    = [0.08 0.08 0.08];

%% ============================================================
% FIGURE 1 — Concept Generation Summary
%% ============================================================

fig = figure("Color","w","Position",[80 80 1920 1080],"Renderer","painters");
ax = axes("Position",[0.03 0.03 0.94 0.94]);
axis(ax,[0 100 0 100])
axis(ax,"off")
hold(ax,"on")

text(50,90,"Concept Generation Summary", ...
    "HorizontalAlignment","center","FontName",fontName, ...
    "FontSize",24,"FontWeight","bold","Color",darkText)

text(50,85,"Alternatives considered before selecting the reference vehicle and actuator concept", ...
    "HorizontalAlignment","center","FontName",fontName, ...
    "FontSize",13,"Color",darkText)

text(50,76,"Vehicle-Level Alternatives", ...
    "HorizontalAlignment","center","FontName",fontName, ...
    "FontSize",16,"FontWeight","bold","Color",blue)

% Vehicle cards
rectangle("Position",[7 61 25 11],"FaceColor",lightBlue,"EdgeColor",blue,"LineWidth",2.0,"Curvature",0.04)
text(19.5,66.5,sprintf("C1\nLightweight Urban EV\nAlternative"), ...
    "HorizontalAlignment","center","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",12.5,"FontWeight","bold","Color",darkText)

rectangle("Position",[37.5 61 25 11],"FaceColor",lightGreen,"EdgeColor",green,"LineWidth",2.2,"Curvature",0.04)
text(50,66.5,sprintf("C2\nBalanced Urban EV\nSelected"), ...
    "HorizontalAlignment","center","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",12.5,"FontWeight","bold","Color",darkText)

rectangle("Position",[68 61 25 11],"FaceColor",lightBlue,"EdgeColor",blue,"LineWidth",2.0,"Curvature",0.04)
text(80.5,66.5,sprintf("C3\nHigher-Mass Urban EV\nAlternative"), ...
    "HorizontalAlignment","center","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",12.5,"FontWeight","bold","Color",darkText)

text(50,50,"Brake-Actuator Alternatives", ...
    "HorizontalAlignment","center","FontName",fontName, ...
    "FontSize",16,"FontWeight","bold","Color",blue)

% Actuator cards
rectangle("Position",[7 35 25 11.5],"FaceColor",lightGreen,"EdgeColor",green,"LineWidth",2.2,"Curvature",0.04)
text(19.5,40.75,sprintf("A1\nElectric Linear Brake Actuator\nSelected"), ...
    "HorizontalAlignment","center","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",12,"FontWeight","bold","Color",darkText)

rectangle("Position",[37.5 35 25 11.5],"FaceColor",lightOrange,"EdgeColor",orange,"LineWidth",2.0,"Curvature",0.04)
text(50,40.75,sprintf("A2\nElectro-Hydraulic Brake Actuator\nAlternative"), ...
    "HorizontalAlignment","center","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",12,"FontWeight","bold","Color",darkText)

rectangle("Position",[68 35 25 11.5],"FaceColor",lightGray,"EdgeColor",gray,"LineWidth",2.0,"Curvature",0.04)
text(80.5,40.75,sprintf("A3\nPure Hydraulic Brake Actuator\nNot Preferred"), ...
    "HorizontalAlignment","center","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",12,"FontWeight","bold","Color",darkText)

rectangle("Position",[17 15 66 8.5],"FaceColor",[0.98 0.98 0.98],"EdgeColor",gray,"LineWidth",1.3,"Curvature",0.03)
text(50,19.25,sprintf("Final choice: C2 is the reference vehicle concept; A1 is used for physical allocation.\nScope note: concept-level selection only, not production brake-by-wire actuator design."), ...
    "HorizontalAlignment","center","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",11.2,"Color",darkText)

exportgraphics(fig,"figures/concept_generation_summary.png","Resolution",350)
close(fig)

%% ============================================================
% FIGURE 2 — Screening Matrix
%% ============================================================

fig = figure("Color","w","Position",[80 80 1920 1080],"Renderer","painters");
ax = axes("Position",[0.03 0.03 0.94 0.94]);
axis(ax,[0 100 0 100])
axis(ax,"off")
hold(ax,"on")

text(50,90,"Actuator Concept Screening Matrix", ...
    "HorizontalAlignment","center","FontName",fontName, ...
    "FontSize",24,"FontWeight","bold","Color",darkText)

text(50,85,"Mandatory-style screening: + strong alignment | 0 acceptable / neutral | - weak alignment", ...
    "HorizontalAlignment","center","FontName",fontName, ...
    "FontSize",12.5,"Color",darkText)

x0 = 6;
topY = 72;
headerH = 8;
rowH = 10.5;

colW = [18 8 8 9.5 9.5 9.5 7.5 6 5.5 6.5];
colX = x0 + [0 cumsum(colW(1:end-1))];

headers = {
    "Candidate"
    "Speed"
    "Control"
    "Simplicity"
    "Plausibility"
    "Traceability"
    "Scope"
    "Score"
    "Rank"
    "Decision"
};

% Header row
for c = 1:numel(headers)
    rectangle("Position",[colX(c) topY colW(c) headerH], ...
        "FaceColor",lightBlue,"EdgeColor",blue,"LineWidth",1.4)
    text(colX(c)+colW(c)/2, topY+headerH/2, headers{c}, ...
        "HorizontalAlignment","center","VerticalAlignment","middle", ...
        "FontName",fontName,"FontSize",10.5,"FontWeight","bold","Color",darkText)
end

screenRows = {
    sprintf("A1\nElectric Linear\nBrake Actuator"), "+", "+", "+", "0", "+", "+", "5", "1", "Preferred"
    sprintf("A2\nElectro-Hydraulic\nBrake Actuator"), "+", "+", "0", "+", "+", "0", "4", "2", "Alternative"
    sprintf("A3\nPure Hydraulic\nBrake Actuator"), "0", "-", "-", "+", "0", "-", "-1", "3", "Rejected"
};

for r = 1:3
    y = topY - r*rowH;

    for c = 1:numel(headers)
        val = screenRows{r,c};

        if c == 1
            bg = lightGray; edge = gray; fs = 9.2; fw = "bold";
        elseif c >= 2 && c <= 7
            if strcmp(val,"+")
                bg = lightGreen; edge = green;
            elseif strcmp(val,"0")
                bg = lightOrange; edge = orange;
            else
                bg = lightRed; edge = red;
            end
            fs = 17; fw = "bold";
        elseif c == 8 || c == 9
            bg = [1 1 1]; edge = gray; fs = 11.5; fw = "bold";
        else
            if r == 1
                bg = lightGreen; edge = green;
            elseif r == 2
                bg = lightOrange; edge = orange;
            else
                bg = lightRed; edge = red;
            end
            fs = 8.8; fw = "bold";
        end

        rectangle("Position",[colX(c) y colW(c) rowH], ...
            "FaceColor",bg,"EdgeColor",edge,"LineWidth",1.1)

        text(colX(c)+colW(c)/2, y+rowH/2, val, ...
            "HorizontalAlignment","center","VerticalAlignment","middle", ...
            "FontName",fontName,"FontSize",fs,"FontWeight",fw,"Color",darkText)
    end
end

% Compact legend
rectangle("Position",[23 31 3.5 2.8],"FaceColor",lightGreen,"EdgeColor",green,"LineWidth",1.1)
text(28,32.4,"+ Strong","HorizontalAlignment","left","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",10.5,"FontWeight","bold","Color",darkText)

rectangle("Position",[45 31 3.5 2.8],"FaceColor",lightOrange,"EdgeColor",orange,"LineWidth",1.1)
text(50,32.4,"0 Neutral","HorizontalAlignment","left","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",10.5,"FontWeight","bold","Color",darkText)

rectangle("Position",[66 31 3.5 2.8],"FaceColor",lightRed,"EdgeColor",red,"LineWidth",1.1)
text(71,32.4,"- Weak","HorizontalAlignment","left","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",10.5,"FontWeight","bold","Color",darkText)

rectangle("Position",[18 17 64 8],"FaceColor",[0.98 0.98 0.98],"EdgeColor",gray,"LineWidth",1.3,"Curvature",0.03)
text(50,21,sprintf("Screening result: A1 is preferred because it is simple, traceable to the Simulink brake-request output,\nand suitable for concept-level physical allocation."), ...
    "HorizontalAlignment","center","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",10.8,"FontWeight","bold","Color",darkText)

exportgraphics(fig,"figures/actuator_concept_screening_matrix.png","Resolution",350)
close(fig)

%% ============================================================
% FIGURE 3 — Scoring Matrix
%% ============================================================

fig = figure("Color","w","Position",[80 80 1920 1080],"Renderer","painters");
ax = axes("Position",[0.03 0.03 0.94 0.94]);
axis(ax,[0 100 0 100])
axis(ax,"off")
hold(ax,"on")

text(50,90,"Actuator Concept Scoring Matrix", ...
    "HorizontalAlignment","center","FontName",fontName, ...
    "FontSize",24,"FontWeight","bold","Color",darkText)

text(50,85,"Weighted selection using a 1-5 scale; higher total means stronger suitability for this project scope", ...
    "HorizontalAlignment","center","FontName",fontName, ...
    "FontSize",12.5,"Color",darkText)

x0 = 6;
topY = 72;
headerH = 8;
rowH = 10.5;

colW = [18 8.5 8.5 9.5 9.5 9.5 8 5.5 11];
colX = x0 + [0 cumsum(colW(1:end-1))];

scoreHeaders = {
    "Candidate"
    sprintf("Control\n25%%")
    sprintf("Delay\n20%%")
    sprintf("Simplicity\n20%%")
    sprintf("Physical\n15%%")
    sprintf("Traceable\n20%%")
    "Total"
    "Rank"
    "Decision"
};

for c = 1:numel(scoreHeaders)
    rectangle("Position",[colX(c) topY colW(c) headerH], ...
        "FaceColor",lightBlue,"EdgeColor",blue,"LineWidth",1.4)
    text(colX(c)+colW(c)/2, topY+headerH/2, scoreHeaders{c}, ...
        "HorizontalAlignment","center","VerticalAlignment","middle", ...
        "FontName",fontName,"FontSize",10.2,"FontWeight","bold","Color",darkText)
end

scoreRows = {
    sprintf("A1\nElectric Linear\nBrake Actuator"), "5", "4", "5", "3", "5", "4.50", "1", "Selected"
    sprintf("A2\nElectro-Hydraulic\nBrake Actuator"), "4", "5", "3", "5", "4", "4.05", "2", "Alternative"
    sprintf("A3\nPure Hydraulic\nBrake Actuator"), "2", "3", "2", "4", "2", "2.45", "3", "Rejected"
};

for r = 1:3
    y = topY - r*rowH;

    for c = 1:numel(scoreHeaders)
        val = scoreRows{r,c};

        if c == 1
            bg = lightGray; edge = gray; fs = 9.2; fw = "bold";
        elseif c >= 2 && c <= 6
            bg = [1 1 1]; edge = gray; fs = 11.5; fw = "normal";
        elseif c == 7
            bg = lightOrange; edge = orange; fs = 11.5; fw = "bold";
        elseif c == 8
            bg = [1 1 1]; edge = gray; fs = 11.5; fw = "bold";
        else
            if r == 1
                bg = lightGreen; edge = green;
            elseif r == 2
                bg = lightOrange; edge = orange;
            else
                bg = lightRed; edge = red;
            end
            fs = 9.5; fw = "bold";
        end

        rectangle("Position",[colX(c) y colW(c) rowH], ...
            "FaceColor",bg,"EdgeColor",edge,"LineWidth",1.1)

        text(colX(c)+colW(c)/2, y+rowH/2, val, ...
            "HorizontalAlignment","center","VerticalAlignment","middle", ...
            "FontName",fontName,"FontSize",fs,"FontWeight",fw,"Color",darkText)
    end
end

rectangle("Position",[16 32 68 6],"FaceColor",lightBlue,"EdgeColor",blue,"LineWidth",1.3,"Curvature",0.03)
text(50,35,"Weights: Control 25% | Delay 20% | Simplicity 20% | Physical 15% | Traceability 20%", ...
    "HorizontalAlignment","center","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",10.5,"FontWeight","bold","Color",darkText)

rectangle("Position",[18 19 64 8],"FaceColor",[0.98 0.98 0.98],"EdgeColor",gray,"LineWidth",1.3,"Curvature",0.03)
text(50,23,sprintf("Selection result: A1 has the highest weighted score and is selected as the concept-level actuator\nrepresentation for the emergency brake-request output."), ...
    "HorizontalAlignment","center","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",10.8,"FontWeight","bold","Color",darkText)

text(50,12,"Scope reminder: concept-level physical allocation only; not a production actuator design.", ...
    "HorizontalAlignment","center","VerticalAlignment","middle", ...
    "FontName",fontName,"FontSize",10.5,"Color",darkText)

exportgraphics(fig,"figures/actuator_concept_scoring_matrix.png","Resolution",350)
close(fig)

disp("Polished concept figures created successfully.")