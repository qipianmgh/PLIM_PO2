% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQWaitUntilTaskDone(taskHandle, timeToWait)
status = DAQmxWaitUntilTaskDone(taskHandle, timeToWait);
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWaitUntilTaskDone', 'taskHandle', 1);
%     validateattributes(timeToWait, {'double'}, {'scalar'}, 'DAQmxWaitUntilTaskDone', 'timeToWait', 2);
%     [status]= mexNIDAQmx('DAQmxWaitUntilTaskDone', taskHandle, timeToWait);
end
