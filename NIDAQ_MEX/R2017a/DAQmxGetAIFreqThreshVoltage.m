% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIFreqThreshVoltage(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIFreqThreshVoltage', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIFreqThreshVoltage', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIFreqThreshVoltage', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIFreqThreshVoltage', taskHandle, channel, data);
end
