% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPulseLowTicks(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPulseLowTicks', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPulseLowTicks', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPulseLowTicks', taskHandle, channel);
end
