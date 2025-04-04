% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQUnreserveTask(taskHandle)
status = DAQmxTaskControl(taskHandle, DAQmx_Val_Task_Unreserve);
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxTaskControl', 'taskHandle', 1);
%     validateattributes(action, {'int32'}, {'scalar'}, 'DAQmxTaskControl', 'action', 2);
%     [status]= mexNIDAQmx('DAQmxTaskControl', taskHandle, action);
end
