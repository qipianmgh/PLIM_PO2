% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetCOPulseLowTicks(taskHandle, channel, data)
status = DAQmxSetCOPulseLowTicks(taskHandle, channel, uint32(data));
if status ~=0
  % errorString = DAQGetErrorString(status);
  % error(errorString);
  errorString = DAQGetExtendedErrorInfo();
  error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseLowTicks', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseLowTicks', 'channel', 2);
%     validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCOPulseLowTicks', 'data', 3);
%     [status]= mexNIDAQmx('DAQmxSetCOPulseLowTicks', taskHandle, channel, data);
end
