% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIForceUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIForceUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIForceUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIForceUnits', taskHandle, channel);
end
