% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOVoltageCurrentLimit(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOVoltageCurrentLimit', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOVoltageCurrentLimit', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAOVoltageCurrentLimit', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOVoltageCurrentLimit', taskHandle, channel, data);
end
