% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetCOPulseFreqInitialDelay(taskHandle, channel, data)
status = DAQmxSetCOPulseFreqInitialDelay(taskHandle, channel, double(data));
if status ~=0
  % errorString = DAQGetErrorString(status);
  % error(errorString);
  errorString = DAQGetExtendedErrorInfo();
  error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseFreqInitialDelay', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseFreqInitialDelay', 'channel', 2);
%     validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCOPulseFreqInitialDelay', 'data', 3);
%     [status]= mexNIDAQmx('DAQmxSetCOPulseFreqInitialDelay', taskHandle, channel, data);
end
