% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAICurrentACRMSUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAICurrentACRMSUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAICurrentACRMSUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAICurrentACRMSUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAICurrentACRMSUnits', taskHandle, channel, data);
end
