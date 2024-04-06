function [status,data] = DAQGetBufInputBufSize(taskHandle)
[status,data] = DAQmxGetBufInputBufSize(taskHandle, uint32(0));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetBufInputBufSize', 'taskHandle', 1);
%     validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetBufInputBufSize', 'data', 2);
%     [status, data]= mexNIDAQmx('DAQmxGetBufInputBufSize', taskHandle, data);
end
 

