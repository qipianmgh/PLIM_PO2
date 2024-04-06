% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIEddyCurrentProxProbeUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIEddyCurrentProxProbeUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIEddyCurrentProxProbeUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIEddyCurrentProxProbeUnits', taskHandle, channel);
end
