% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIExcitDCorAC(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIExcitDCorAC', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIExcitDCorAC', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIExcitDCorAC', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIExcitDCorAC', taskHandle, channel, data);
end
