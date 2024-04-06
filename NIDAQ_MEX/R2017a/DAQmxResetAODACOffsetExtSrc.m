% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAODACOffsetExtSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAODACOffsetExtSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAODACOffsetExtSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAODACOffsetExtSrc', taskHandle, channel);
end
