% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAODACOffsetSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAODACOffsetSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAODACOffsetSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAODACOffsetSrc', taskHandle, channel);
end
