% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOVoltageUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOVoltageUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOVoltageUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAOVoltageUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOVoltageUnits', taskHandle, channel, data);
end
