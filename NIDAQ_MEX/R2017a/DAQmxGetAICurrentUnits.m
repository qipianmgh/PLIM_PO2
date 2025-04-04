% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAICurrentUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAICurrentUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAICurrentUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAICurrentUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAICurrentUnits', taskHandle, channel, data);
end
