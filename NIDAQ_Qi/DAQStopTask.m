function status = DAQStopTask(taskHandle)
status = DAQmxStopTask(uint64(taskHandle));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(1, 1);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxStopTask', 'taskHandle', 1);
%     [status]= mexNIDAQmx('DAQmxStopTask', taskHandle);
end