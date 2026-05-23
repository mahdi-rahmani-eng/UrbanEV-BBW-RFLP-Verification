%% build_white_box_physical_allocation_final.m
% Regenerates the final White Box Physical Allocation figure.

clear
clc
close all

cd("C:\Users\USER\Desktop\github\UrbanEV_BBW_FRESH")

if ~isfolder("figures")
    mkdir("figures")
end

fontName = "Arial";

blueEdge   = [0.12 0.38 0.70];
blueFill   = [0.91 0.96 1.00];
greenEdge  = [0.12 0.48 0.22];
greenFill  = [0.90 0.96 0.90];
orangeEdge = [0.85 0.42 0.08];
orangeFill = [1.00 0.94 0.82];
purpleEdge = [0.35 0.22 0.65];
purpleFill = [0.94 0.91 0.99];
grayEdge   = [0.45 0.45 0.45];
grayFill   = [0.96 0.96 0.96];
darkText   = [0.08 0.08 0.08];

fig = figure("Color","w","Units","pixels","Position",[100 80 1600 900],"Renderer","painters");
set(fig,"InvertHardcopy","off")
set(fig,"PaperPositionMode","auto")

ax = axes("Position",[0 0 1 1]);
axis(ax,[0 100 0 100])
axis(ax,"off")
hold(ax,"on")

rectangle(ax,"Position",[0 0 100 100],"FaceColor","w","EdgeColor","w")

text(ax,50,91,"White Box Physical Allocation","HorizontalAlignment","center","VerticalAlignment","middle","FontName",fontName,"FontSize",24,"FontWeight","bold","Color",darkText)
text(ax,50,86,"Logical blocks are allocated to concept-level physical elements and verification assets","HorizontalAlignment","center","VerticalAlignment","middle","FontName",fontName,"FontSize",13,"Color",darkText)

text(ax,20,76,"Vehicle / Inputs","HorizontalAlignment","center","FontName",fontName,"FontSize",13,"FontWeight","bold","Color",blueEdge)
text(ax,50,76,"Controller Allocation","HorizontalAlignment","center","FontName",fontName,"FontSize",13,"FontWeight","bold","Color",greenEdge)
text(ax,80,76,"Actuation / Verification","HorizontalAlignment","center","FontName",fontName,"FontSize",13,"FontWeight","bold","Color",orangeEdge)

boxW = 22; boxH = 11;
xP01 = 9;  yP01 = 59;
xP02 = 39; yP02 = 59;
xP03 = 69; yP03 = 59;
xP04 = 9;  yP04 = 38;
xP05 = 39; yP05 = 38;
xP06 = 69; yP06 = 38;

rectangle(ax,"Position",[xP01 yP01 boxW boxH],"FaceColor",blueFill,"EdgeColor",blueEdge,"LineWidth",1.8,"Curvature",0.04)
text(ax,xP01+boxW/2,yP01+boxH/2,sprintf("P-01\nLow-Speed Urban EV\nPlatform Context"),"HorizontalAlignment","center","VerticalAlignment","middle","FontName",fontName,"FontSize",10.5,"FontWeight","bold","Color",darkText)

rectangle(ax,"Position",[xP02 yP02 boxW boxH],"FaceColor",greenFill,"EdgeColor",greenEdge,"LineWidth",2.1,"Curvature",0.04)
text(ax,xP02+boxW/2,yP02+boxH/2,sprintf("P-02\nConcept-Level\nBBW Controller"),"HorizontalAlignment","center","VerticalAlignment","middle","FontName",fontName,"FontSize",10.5,"FontWeight","bold","Color",darkText)

rectangle(ax,"Position",[xP03 yP03 boxW boxH],"FaceColor",orangeFill,"EdgeColor",orangeEdge,"LineWidth",1.8,"Curvature",0.04)
text(ax,xP03+boxW/2,yP03+boxH/2,sprintf("P-03\nElectric Linear\nBrake Actuator"),"HorizontalAlignment","center","VerticalAlignment","middle","FontName",fontName,"FontSize",10.5,"FontWeight","bold","Color",darkText)

rectangle(ax,"Position",[xP04 yP04 boxW boxH],"FaceColor",grayFill,"EdgeColor",grayEdge,"LineWidth",1.6,"Curvature",0.04)
text(ax,xP04+boxW/2,yP04+boxH/2,sprintf("P-04\nEgo-Speed\nSource"),"HorizontalAlignment","center","VerticalAlignment","middle","FontName",fontName,"FontSize",10.5,"FontWeight","bold","Color",darkText)

rectangle(ax,"Position",[xP05 yP05 boxW boxH],"FaceColor",grayFill,"EdgeColor",grayEdge,"LineWidth",1.6,"Curvature",0.04)
text(ax,xP05+boxW/2,yP05+boxH/2,sprintf("P-05\nForward Target /\nObstacle Assumption"),"HorizontalAlignment","center","VerticalAlignment","middle","FontName",fontName,"FontSize",10.2,"FontWeight","bold","Color",darkText)

rectangle(ax,"Position",[xP06 yP06 boxW boxH],"FaceColor",purpleFill,"EdgeColor",purpleEdge,"LineWidth",1.8,"Curvature",0.04)
text(ax,xP06+boxW/2,yP06+boxH/2,sprintf("P-06\nMATLAB / Simulink\nVerification Environment"),"HorizontalAlignment","center","VerticalAlignment","middle","FontName",fontName,"FontSize",10.0,"FontWeight","bold","Color",darkText)

% Required allocation logic:
% P-01 -> P-02, P-04 -> P-02, P-05 -> P-02, P-02 -> P-03, P-02 -> P-06
annotation("arrow",[(xP01+boxW)/100, xP02/100],[(yP01+boxH/2)/100, (yP02+boxH/2)/100],"Color",blueEdge,"LineWidth",1.7,"HeadLength",9,"HeadWidth",9)
annotation("arrow",[(xP02+boxW)/100, xP03/100],[(yP02+boxH/2)/100, (yP03+boxH/2)/100],"Color",greenEdge,"LineWidth",1.7,"HeadLength",9,"HeadWidth",9)
annotation("arrow",[(xP04+boxW)/100, xP02/100],[(yP04+boxH/2)/100, (yP02+boxH*0.25)/100],"Color",grayEdge,"LineWidth",1.45,"HeadLength",8,"HeadWidth",8)
annotation("arrow",[(xP05+boxW/2)/100, (xP02+boxW/2)/100],[(yP05+boxH)/100, yP02/100],"Color",grayEdge,"LineWidth",1.45,"HeadLength",8,"HeadWidth",8)
annotation("arrow",[(xP02+boxW)/100, xP06/100],[(yP02+boxH*0.25)/100, (yP06+boxH/2)/100],"Color",purpleEdge,"LineWidth",1.45,"HeadLength",8,"HeadWidth",8)

rectangle(ax,"Position",[18 14.5 64 8.5],"FaceColor",[0.985 0.985 0.985],"EdgeColor",grayEdge,"LineWidth",1.2,"Curvature",0.025)
text(ax,50,18.75,sprintf("Scope note: physical allocation is concept-level only. It identifies candidate system elements;\nit does not claim production hardware design or certified brake-by-wire architecture."),"HorizontalAlignment","center","VerticalAlignment","middle","FontName",fontName,"FontSize",10.5,"Color",darkText)

outFile = "figures/white_box_physical_allocation.png";
exportgraphics(fig,outFile,"Resolution",350)
disp("Final White Box Physical Allocation figure created successfully.")
disp("Saved to: " + outFile)
