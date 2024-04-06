% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetAILowpassCutoffFreq(taskHandle, channel, data)
status = DAQmxSetAILowpassCutoffFreq(taskHandle, char(channel), data);
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
 errorString = DAQGetExtendedErrorInfo();
 error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAILowpassCutoffFreq', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAILowpassCutoffFreq', 'channel', 2);
%     validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAILowpassCutoffFreq', 'data', 3);
%     [status]= mexNIDAQmx('DAQmxSetAILowpassCutoffFreq', taskHandle, channel, data);
end
