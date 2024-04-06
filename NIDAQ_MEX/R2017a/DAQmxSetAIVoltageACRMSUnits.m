% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIVoltageACRMSUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIVoltageACRMSUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIVoltageACRMSUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIVoltageACRMSUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIVoltageACRMSUnits', taskHandle, channel, data);
end
