% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQGetSampClkRate(taskHandle)
[status, data] = DAQmxGetSampClkRate(taskHandle, double([0]));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampClkRate', 'taskHandle', 1);
%     validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSampClkRate', 'data', 2);
%     [status, data]= mexNIDAQmx('DAQmxGetSampClkRate', taskHandle, data);
end
