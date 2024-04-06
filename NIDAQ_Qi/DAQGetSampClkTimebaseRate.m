% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQGetSampClkTimebaseRate(taskHandle)
[status, data] = DAQmxGetSampClkTimebaseRate(taskHandle, double([0]));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampClkTimebaseRate', 'taskHandle', 1);
%     validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSampClkTimebaseRate', 'data', 2);
%     [status, data]= mexNIDAQmx('DAQmxGetSampClkTimebaseRate', taskHandle, data);
end
