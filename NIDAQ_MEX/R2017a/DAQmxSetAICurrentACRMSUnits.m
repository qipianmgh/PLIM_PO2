% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAICurrentACRMSUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAICurrentACRMSUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAICurrentACRMSUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAICurrentACRMSUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAICurrentACRMSUnits', taskHandle, channel, data);
end
