% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetAILowpassEnable(taskHandle, channel, data)
status = DAQmxSetAILowpassEnable(taskHandle, channel, uint32(data));
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAILowpassEnable', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAILowpassEnable', 'channel', 2);
%     validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAILowpassEnable', 'data', 3);
%     [status]= mexNIDAQmx('DAQmxSetAILowpassEnable', taskHandle, channel, data);
end
