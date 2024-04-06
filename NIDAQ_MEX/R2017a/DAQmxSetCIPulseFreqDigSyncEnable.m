% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseFreqDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseFreqDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseFreqDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIPulseFreqDigSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseFreqDigSyncEnable', taskHandle, channel, data);
end
