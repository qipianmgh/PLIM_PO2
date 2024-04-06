% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOResolutionUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOResolutionUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOResolutionUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOResolutionUnits', taskHandle, channel);
end
