% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetArmStartTrigType(taskHandle, data)
status = DAQmxSetArmStartTrigType(taskHandle, int32(data));
if status ~=0
 % errorString = DAQGetErrorString(status);
 % error(errorString);
 errorString = DAQGetExtendedErrorInfo();
 error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetArmStartTrigType', 'taskHandle', 1);
%     validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetArmStartTrigType', 'data', 2);
%     [status]= mexNIDAQmx('DAQmxSetArmStartTrigType', taskHandle, data);
end
