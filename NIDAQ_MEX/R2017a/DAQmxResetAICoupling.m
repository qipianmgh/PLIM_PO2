% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAICoupling(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAICoupling', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAICoupling', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAICoupling', taskHandle, channel);
end
