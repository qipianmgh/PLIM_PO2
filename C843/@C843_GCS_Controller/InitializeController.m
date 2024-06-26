function c = InitializeController(c)
%function c = InitializeController(c)

% This code is provided by Physik Instrumente(PI) GmbH&Co.KG
% You may alter it corresponding to your needs
% Comments and Corrections are very welcome
% Please contact us by mailing to support-software@pi.ws

c.IDN = qIDN(c);
c.IDN = strrep(c.IDN,'\n','');
c.IDN = strrep(c.IDN,'\r','');

c.NumberOfAnalogInputs = qTNR(c);
try
    c.GCSVersion = qCSV(c);
catch
    c.GCSVersion = 1;
end
try
    szAxes = qSAI_ALL(c);
    szAxes = strrep(szAxes,char(10),'');
    szAxes = strrep(szAxes,char(13),'');
    c.NumberOfAxes = length(szAxes);
    
    c.initialized = 1;
catch
    szAxes = qSAI(c);
    szAxes = strrep(szAxes,char(10),'');
    szAxes = strrep(szAxes,char(13),'');
    c.NumberOfAxes = length(szAxes);
    c.initialized = 1;    
end
