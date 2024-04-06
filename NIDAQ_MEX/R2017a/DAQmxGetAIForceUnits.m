% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIForceUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIForceUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIForceUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIForceUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIForceUnits', taskHandle, channel, data);
end
