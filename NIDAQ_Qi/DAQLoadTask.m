function [status, taskHandle] = DAQLoadTask(taskName, taskHandle)
[status, taskHandle] = DAQmxLoadTask(taskName, taskHandle);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(taskName, {'char'}, {'vector'}, 'DAQmxLoadTask', 'taskName', 1);
%     validateattributes(taskHandle, {'uint64'}, {'vector'}, 'DAQmxLoadTask', 'taskHandle', 2);
%     [status, taskHandle]= mexNIDAQmx('DAQmxLoadTask', taskName, taskHandle);
end
