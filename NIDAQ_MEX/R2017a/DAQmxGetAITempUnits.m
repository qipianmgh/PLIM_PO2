% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAITempUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAITempUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAITempUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAITempUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAITempUnits', taskHandle, channel, data);
end
