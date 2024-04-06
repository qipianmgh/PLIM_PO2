% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOCurrentUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOCurrentUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOCurrentUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOCurrentUnits', taskHandle, channel);
end
