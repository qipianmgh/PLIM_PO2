% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOUseOnlyOnBrdMem(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOUseOnlyOnBrdMem', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOUseOnlyOnBrdMem', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOUseOnlyOnBrdMem', taskHandle, channel);
end
