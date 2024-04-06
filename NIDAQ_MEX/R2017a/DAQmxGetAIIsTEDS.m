% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIIsTEDS(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIIsTEDS', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIIsTEDS', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAIIsTEDS', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIIsTEDS', taskHandle, channel, data);
end
