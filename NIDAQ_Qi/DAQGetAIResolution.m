function [status, data] = DAQGetAIResolution(taskHandle, channel)
[status, data] = DAQmxGetAIResolution(taskHandle, channel, double(0));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end

%     narginchk(3, 3);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIResolution', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIResolution', 'channel', 2);
%     validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIResolution', 'data', 3);
%     [status, data]= mexNIDAQmx('DAQmxGetAIResolution', taskHandle, channel, data);
end
