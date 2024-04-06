% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetWriteRegenMode(taskHandle, data)
status = DAQmxSetWriteRegenMode(taskHandle, int32(data));
if status ~=0
  % errorString = DAQGetErrorString(status);
  % error(errorString);
  errorString = DAQGetExtendedErrorInfo();
  error(errorString);
end
%     narginchk(2, 2);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetWriteRegenMode', 'taskHandle', 1);
%     validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetWriteRegenMode', 'data', 2);
%     [status]= mexNIDAQmx('DAQmxSetWriteRegenMode', taskHandle, data);
%     DAQmx_Val_AllowRegen    DAQmx_Val_DoNotAllowRegen

end
