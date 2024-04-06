% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOResolutionUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOResolutionUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOResolutionUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAOResolutionUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOResolutionUnits', taskHandle, channel, data);
end
