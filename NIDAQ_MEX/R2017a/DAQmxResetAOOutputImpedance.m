% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOOutputImpedance(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOOutputImpedance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOOutputImpedance', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOOutputImpedance', taskHandle, channel);
end
