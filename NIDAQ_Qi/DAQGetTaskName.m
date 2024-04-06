function [status, data] = DAQGetTaskName(taskHandle)
[status, data] = DAQmxGetTaskName(taskHandle, char(1024), uint32(1024));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetTaskName', 'taskHandle', 1);
%     validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetTaskName', 'data', 2);
%     validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetTaskName', 'bufferSize', 3);
%     [status, data]= mexNIDAQmx('DAQmxGetTaskName', taskHandle, data, bufferSize);
end
