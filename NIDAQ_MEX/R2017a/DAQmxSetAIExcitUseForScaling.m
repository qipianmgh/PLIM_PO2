% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIExcitUseForScaling(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIExcitUseForScaling', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIExcitUseForScaling', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAIExcitUseForScaling', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIExcitUseForScaling', taskHandle, channel, data);
end
