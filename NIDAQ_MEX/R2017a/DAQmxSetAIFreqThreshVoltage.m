% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIFreqThreshVoltage(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIFreqThreshVoltage', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIFreqThreshVoltage', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIFreqThreshVoltage', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIFreqThreshVoltage', taskHandle, channel, data);
end
