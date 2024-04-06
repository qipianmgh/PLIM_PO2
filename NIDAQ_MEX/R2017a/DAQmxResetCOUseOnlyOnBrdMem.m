% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOUseOnlyOnBrdMem(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOUseOnlyOnBrdMem', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOUseOnlyOnBrdMem', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOUseOnlyOnBrdMem', taskHandle, channel);
end
