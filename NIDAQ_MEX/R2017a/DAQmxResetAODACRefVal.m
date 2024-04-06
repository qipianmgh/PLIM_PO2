% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAODACRefVal(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAODACRefVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAODACRefVal', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAODACRefVal', taskHandle, channel);
end
