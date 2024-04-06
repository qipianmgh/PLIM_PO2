% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAODACRefAllowConnToGnd(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAODACRefAllowConnToGnd', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAODACRefAllowConnToGnd', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAODACRefAllowConnToGnd', taskHandle, channel);
end
