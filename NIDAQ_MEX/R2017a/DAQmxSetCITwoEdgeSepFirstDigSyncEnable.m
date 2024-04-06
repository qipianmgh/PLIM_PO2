% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCITwoEdgeSepFirstDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepFirstDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCITwoEdgeSepFirstDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepFirstDigSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCITwoEdgeSepFirstDigSyncEnable', taskHandle, channel, data);
end
