% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetStartTrigDelayUnits(taskHandle, data)
status = DAQmxSetStartTrigDelayUnits(taskHandle, data);
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
   errorString = DAQGetExtendedErrorInfo();
   error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetStartTrigDelayUnits', 'taskHandle', 1);
%     validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetStartTrigDelayUnits', 'data', 2);
%     [status]= mexNIDAQmx('DAQmxSetStartTrigDelayUnits', taskHandle, data);
end
