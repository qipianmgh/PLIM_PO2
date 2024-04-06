% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIDitherEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIDitherEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIDitherEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIDitherEnable', taskHandle, channel);
end
