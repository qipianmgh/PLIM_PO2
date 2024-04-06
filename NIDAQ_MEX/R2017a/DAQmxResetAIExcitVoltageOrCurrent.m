% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIExcitVoltageOrCurrent(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIExcitVoltageOrCurrent', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIExcitVoltageOrCurrent', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIExcitVoltageOrCurrent', taskHandle, channel);
end
