function isTaskDone = DAQIsTaskDone(taskHandle)
[status, isTaskDone] = DAQmxIsTaskDone(taskHandle, uint32([0]));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(2, 2);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxIsTaskDone', 'taskHandle', 1);
%     validateattributes(isTaskDone, {'uint32'}, {'vector'}, 'DAQmxIsTaskDone', 'isTaskDone', 2);
%     [status, isTaskDone]= mexNIDAQmx('DAQmxIsTaskDone', taskHandle, isTaskDone);
end