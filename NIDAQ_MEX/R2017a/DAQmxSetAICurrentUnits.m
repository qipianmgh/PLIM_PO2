% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAICurrentUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAICurrentUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAICurrentUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAICurrentUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAICurrentUnits', taskHandle, channel, data);
end
