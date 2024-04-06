% Copyright 2010 - 2015 The MathWorks, Inc.
function status = DAQSetAOUseOnlyOnBrdMem(taskHandle, channel, data)
status = DAQmxSetAOUseOnlyOnBrdMem(taskHandle, channel, uint32(data));
if status ~=0
  % errorString = DAQGetErrorString(status);
  % error(errorString);
    errorString = DAQGetExtendedErrorInfo();
    error(errorString);
end
%     narginchk(3, 3);
%     nargoutchk(1, 1);
%     validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOUseOnlyOnBrdMem', 'taskHandle', 1);
%     validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOUseOnlyOnBrdMem', 'channel', 2);
%     validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAOUseOnlyOnBrdMem', 'data', 3);
%     [status]= mexNIDAQmx('DAQmxSetAOUseOnlyOnBrdMem', taskHandle, channel, data);
end


% DAQmx_Val_OnBrdMemEmpty	10235	Transfer data to the device only when there is no data in the onboard memory of the device.
% DAQmx_Val_OnBrdMemHalfFullOrLess	10239	Transfer data to the device any time the onboard memory is less than half full.
% DAQmx_Val_OnBrdMemNotFull	10242	Transfer data to the device any time the onboard memory of the device is not full.


