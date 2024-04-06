% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIVoltageACRMSUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIVoltageACRMSUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIVoltageACRMSUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIVoltageACRMSUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIVoltageACRMSUnits', taskHandle, channel, data);
end
