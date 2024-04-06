% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAODACOffsetVal(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAODACOffsetVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAODACOffsetVal', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAODACOffsetVal', taskHandle, channel);
end
