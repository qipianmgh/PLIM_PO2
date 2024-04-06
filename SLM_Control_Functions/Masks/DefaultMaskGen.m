clear
clc
close all
CenterPosX = 256.5;
CenterPosY = 256.5;
GratingPeriod = 16;
VortexCharge = 0;
Path = [pwd,'\DefaultMask.tiff'];


x = (1:512)-CenterPosX;
y = (1:512)-CenterPosY;
[X,Y] = meshgrid(x, y);
phi = angle(X+1i*Y); %%Azimuthal angle
fx = 1/GratingPeriod; 
fy = 0;
Temp = mod(2*VortexCharge*phi+2*pi*(Y*fy+X*fx),2*pi);
Mask = uint16(Temp/max(Temp(:))*65535);
imwrite(Mask,Path);