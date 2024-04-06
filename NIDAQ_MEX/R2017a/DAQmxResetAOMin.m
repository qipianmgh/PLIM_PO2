% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOMin(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOMin', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOMin', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOMin', taskHandle, channel);
end
