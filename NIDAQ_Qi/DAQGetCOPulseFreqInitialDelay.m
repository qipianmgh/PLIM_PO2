% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQGetCOPulseFreqInitialDelay(taskHandle, channel)
[status, data] = DAQmxGetCOPulseFreqInitialDelay(taskHandle, channel, [0]);
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOPulseFreqInitialDelay', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOPulseFreqInitialDelay', 'channel', 2);
%     validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCOPulseFreqInitialDelay', 'data', 3);
%     [status, data]= mexNIDAQmx('DAQmxGetCOPulseFreqInitialDelay', taskHandle, channel, data);
end
