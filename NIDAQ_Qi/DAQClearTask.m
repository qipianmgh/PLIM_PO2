function status = DAQClearTask(taskHandle)
status = DAQmxClearTask(taskHandle);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(1, 1);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxClearTask', 'taskHandle', 1);
%     [status]= mexNIDAQmx('DAQmxClearTask', taskHandle);
end