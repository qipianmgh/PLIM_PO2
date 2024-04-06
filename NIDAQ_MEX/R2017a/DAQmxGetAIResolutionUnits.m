% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIResolutionUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIResolutionUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIResolutionUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIResolutionUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIResolutionUnits', taskHandle, channel, data);
end
