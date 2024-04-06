% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIExcitSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIExcitSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIExcitSrc', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIExcitSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIExcitSrc', taskHandle, channel, data);
end
