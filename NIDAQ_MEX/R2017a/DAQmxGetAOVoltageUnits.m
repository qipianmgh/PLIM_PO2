% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOVoltageUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOVoltageUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOVoltageUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAOVoltageUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOVoltageUnits', taskHandle, channel, data);
end
