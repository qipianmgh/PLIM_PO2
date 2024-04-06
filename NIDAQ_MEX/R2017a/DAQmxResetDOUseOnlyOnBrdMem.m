% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDOUseOnlyOnBrdMem(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDOUseOnlyOnBrdMem', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDOUseOnlyOnBrdMem', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDOUseOnlyOnBrdMem', taskHandle, channel);
end
