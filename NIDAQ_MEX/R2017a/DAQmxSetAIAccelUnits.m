% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIAccelUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIAccelUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIAccelUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIAccelUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIAccelUnits', taskHandle, channel, data);
end
