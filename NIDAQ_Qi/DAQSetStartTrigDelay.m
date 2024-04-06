% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetStartTrigDelay(taskHandle, data)
status = DAQmxSetStartTrigDelay(taskHandle, double(data));
if status ~=0
   errorString = DAQGetErrorString(status);
   error(errorString);
 % errorString = DAQGetExtendedErrorInfo();
 % error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetStartTrigDelay', 'taskHandle', 1);
%     validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetStartTrigDelay', 'data', 2);
%     [status]= mexNIDAQmx('DAQmxSetStartTrigDelay', taskHandle, data);
end
