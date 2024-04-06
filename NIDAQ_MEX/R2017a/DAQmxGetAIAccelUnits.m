% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIAccelUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIAccelUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIAccelUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIAccelUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIAccelUnits', taskHandle, channel, data);
end
