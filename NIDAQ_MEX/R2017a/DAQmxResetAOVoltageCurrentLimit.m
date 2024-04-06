% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOVoltageCurrentLimit(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOVoltageCurrentLimit', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOVoltageCurrentLimit', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOVoltageCurrentLimit', taskHandle, channel);
end
