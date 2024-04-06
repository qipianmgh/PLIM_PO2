% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetCOPulseFreq(taskHandle, channel, data)
status = DAQmxSetCOPulseFreq(taskHandle, channel, double(data));
if status ~=0
  % errorString = DAQGetErrorString(status);
  % error(errorString);
  errorString = DAQGetExtendedErrorInfo();
  error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseFreq', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseFreq', 'channel', 2);
%     validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCOPulseFreq', 'data', 3);
%     [status]= mexNIDAQmx('DAQmxSetCOPulseFreq', taskHandle, channel, data);
end
