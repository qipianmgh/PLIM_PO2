% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIFreqUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIFreqUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIFreqUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIFreqUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIFreqUnits', taskHandle, channel, data);
end
