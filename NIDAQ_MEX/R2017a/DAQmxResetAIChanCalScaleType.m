% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIChanCalScaleType(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIChanCalScaleType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIChanCalScaleType', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIChanCalScaleType', taskHandle, channel);
end
