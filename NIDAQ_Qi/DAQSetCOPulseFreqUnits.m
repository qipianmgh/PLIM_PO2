% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetCOPulseFreqUnits(taskHandle, channel, data)
status = DAQmxSetCOPulseFreqUnits(taskHandle, channel, int32(data));
if status ~=0
  % errorString = DAQGetErrorString(status);
  % error(errorString);
  errorString = DAQGetExtendedErrorInfo();
  error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseFreqUnits', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseFreqUnits', 'channel', 2);
%     validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCOPulseFreqUnits', 'data', 3);
%     [status]= mexNIDAQmx('DAQmxSetCOPulseFreqUnits', taskHandle, channel, data);
end
