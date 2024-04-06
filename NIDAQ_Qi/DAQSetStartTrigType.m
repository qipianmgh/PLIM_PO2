% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetStartTrigType(taskHandle, data)
status = DAQmxSetStartTrigType(taskHandle, int32(data));
if status ~=0
  % errorString = DAQGetErrorString(status);
  % error(errorString);
  errorString = DAQGetExtendedErrorInfo();
  error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetStartTrigType', 'taskHandle', 1);
%     validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetStartTrigType', 'data', 2);
%     [status]= mexNIDAQmx('DAQmxSetStartTrigType', taskHandle, data);
end
