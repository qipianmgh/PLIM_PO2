% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxPerformBridgeOffsetNullingCalEx(taskHandle, channel, skipUnsupportedChannels)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxPerformBridgeOffsetNullingCalEx', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxPerformBridgeOffsetNullingCalEx', 'channel', 2);
    validateattributes(skipUnsupportedChannels, {'uint32'}, {'scalar'}, 'DAQmxPerformBridgeOffsetNullingCalEx', 'skipUnsupportedChannels', 3);
    [status]= mexNIDAQmx('DAQmxPerformBridgeOffsetNullingCalEx', taskHandle, channel, skipUnsupportedChannels);
end
