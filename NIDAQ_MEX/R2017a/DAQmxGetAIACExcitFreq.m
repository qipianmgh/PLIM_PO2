% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIACExcitFreq(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIACExcitFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIACExcitFreq', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIACExcitFreq', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIACExcitFreq', taskHandle, channel, data);
end
