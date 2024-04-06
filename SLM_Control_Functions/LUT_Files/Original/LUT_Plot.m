clear
clc
close all

LUT_1 = load('E:\DMD_SLM_Coding\LUT_Files\Original\slm4289_at1064_P16.lut');
figure
plot(LUT_1(:,1),LUT_1(:,2));
grid on

LUT_2 = load('E:\DMD_SLM_Coding\LUT_Files\Original\half.lut');
figure
plot(LUT_2(:,1),LUT_2(:,2));
grid on

LUT_3 = load('E:\DMD_SLM_Coding\LUT_Files\Original\linear.lut');
figure
plot(LUT_3(:,1),LUT_3(:,2));
grid on