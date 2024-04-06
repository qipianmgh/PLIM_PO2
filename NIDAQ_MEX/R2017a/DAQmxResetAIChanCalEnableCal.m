% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIChanCalEnableCal(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIChanCalEnableCal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIChanCalEnableCal', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIChanCalEnableCal', taskHandle, channel);
end
