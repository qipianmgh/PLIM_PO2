% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOVoltageCurrentLimit(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOVoltageCurrentLimit', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOVoltageCurrentLimit', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAOVoltageCurrentLimit', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOVoltageCurrentLimit', taskHandle, channel, data);
end
