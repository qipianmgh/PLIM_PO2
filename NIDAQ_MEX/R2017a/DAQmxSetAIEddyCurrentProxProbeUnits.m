% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIEddyCurrentProxProbeUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIEddyCurrentProxProbeUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIEddyCurrentProxProbeUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIEddyCurrentProxProbeUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIEddyCurrentProxProbeUnits', taskHandle, channel, data);
end
