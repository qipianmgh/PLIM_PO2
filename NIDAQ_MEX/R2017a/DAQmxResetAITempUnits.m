% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAITempUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAITempUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAITempUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAITempUnits', taskHandle, channel);
end
