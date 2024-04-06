% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIChanCalOperatorName(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIChanCalOperatorName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIChanCalOperatorName', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIChanCalOperatorName', taskHandle, channel);
end
