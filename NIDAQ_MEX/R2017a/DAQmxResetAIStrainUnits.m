% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIStrainUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIStrainUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIStrainUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIStrainUnits', taskHandle, channel);
end
