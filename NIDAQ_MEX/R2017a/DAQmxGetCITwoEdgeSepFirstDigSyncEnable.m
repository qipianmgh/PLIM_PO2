% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCITwoEdgeSepFirstDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCITwoEdgeSepFirstDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCITwoEdgeSepFirstDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCITwoEdgeSepFirstDigSyncEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCITwoEdgeSepFirstDigSyncEnable', taskHandle, channel, data);
end
