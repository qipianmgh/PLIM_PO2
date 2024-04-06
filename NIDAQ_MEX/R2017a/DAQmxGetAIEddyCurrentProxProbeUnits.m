% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIEddyCurrentProxProbeUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIEddyCurrentProxProbeUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIEddyCurrentProxProbeUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIEddyCurrentProxProbeUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIEddyCurrentProxProbeUnits', taskHandle, channel, data);
end
