% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOResolutionUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOResolutionUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOResolutionUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAOResolutionUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOResolutionUnits', taskHandle, channel, data);
end
