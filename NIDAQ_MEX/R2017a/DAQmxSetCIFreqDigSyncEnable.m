% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIFreqDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIFreqDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIFreqDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIFreqDigSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIFreqDigSyncEnable', taskHandle, channel, data);
end
