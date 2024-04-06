% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIFreqThreshVoltage(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIFreqThreshVoltage', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIFreqThreshVoltage', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIFreqThreshVoltage', taskHandle, channel);
end
