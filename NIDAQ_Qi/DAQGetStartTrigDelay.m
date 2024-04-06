% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQGetStartTrigDelay(taskHandle)
[status, data] = DAQmxGetStartTrigDelay(taskHandle, double([0]));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetStartTrigDelay', 'taskHandle', 1);
%     validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetStartTrigDelay', 'data', 2);
%     [status, data]= mexNIDAQmx('DAQmxGetStartTrigDelay', taskHandle, data);
end
