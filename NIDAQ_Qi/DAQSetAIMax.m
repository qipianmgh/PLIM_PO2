% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetAIMax(taskHandle, channel, data)
status = DAQmxSetAIMax(taskHandle, channel, data);
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIMax', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIMax', 'channel', 2);
%     validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIMax', 'data', 3);
%     [status]= mexNIDAQmx('DAQmxSetAIMax', taskHandle, channel, data);
end
