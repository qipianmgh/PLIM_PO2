% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQGetStartTrigDelayUnits(taskHandle)
[status, data] = DAQmxGetStartTrigDelayUnits(taskHandle, int32([0]));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetStartTrigDelayUnits', 'taskHandle', 1);
%     validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetStartTrigDelayUnits', 'data', 2);
%     [status, data]= mexNIDAQmx('DAQmxGetStartTrigDelayUnits', taskHandle, data);
end
