% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxPerformBridgeOffsetNullingCal(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxPerformBridgeOffsetNullingCal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxPerformBridgeOffsetNullingCal', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxPerformBridgeOffsetNullingCal', taskHandle, channel);
end
