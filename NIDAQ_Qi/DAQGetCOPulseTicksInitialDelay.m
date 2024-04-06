% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQGetCOPulseTicksInitialDelay(taskHandle, channel)
[status, data] = DAQmxGetCOPulseTicksInitialDelay(uint64(taskHandle), channel, uint32([0]));
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOPulseTicksInitialDelay', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOPulseTicksInitialDelay', 'channel', 2);
%     validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCOPulseTicksInitialDelay', 'data', 3);
%     [status, data]= mexNIDAQmx('DAQmxGetCOPulseTicksInitialDelay', taskHandle, channel, data);
end
