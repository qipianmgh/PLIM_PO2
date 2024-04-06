clear
clc
close all
Phaselevel = 256;
P = 16;
folderpath = ['E:\DMD_SLM_Coding\SLM_MaskGenForCali\256Step\P',num2str(P)];
listing = dir(folderpath);

fid = fopen( ['512_CalibrationP',num2str(P),'.txt'], 'wt' );
for i = 1:Phaselevel
    filename = ['E:\DMD_SLM_Coding\SLM_MaskGenForCali\256Step\P',num2str(P),'\512GratingHor_P',num2str(P),'_Phi_',num2str(i),'.TIFF'];
    fprintf(fid,strrep(filename, '\', '\\'));
    fprintf(fid,'\n');
end

fclose(fid);