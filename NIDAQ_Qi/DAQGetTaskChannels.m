function [status, data] = DAQGetTaskChannels(taskHandle)
[status, data] = DAQmxGetTaskChannels(taskHandle, char(1024), uint32(1024));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetTaskChannels', 'taskHandle', 1);
%     validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetTaskChannels', 'data', 2);
%     validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetTaskChannels', 'bufferSize', 3);
%     [status, data]= mexNIDAQmx('DAQmxGetTaskChannels', taskHandle, data, bufferSize);
end
