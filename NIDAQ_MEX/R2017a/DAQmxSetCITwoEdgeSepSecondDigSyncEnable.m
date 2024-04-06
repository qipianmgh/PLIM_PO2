% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCITwoEdgeSepSecondDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepSecondDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCITwoEdgeSepSecondDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepSecondDigSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCITwoEdgeSepSecondDigSyncEnable', taskHandle, channel, data);
end
