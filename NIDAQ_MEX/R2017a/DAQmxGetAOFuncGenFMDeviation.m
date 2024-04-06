% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOFuncGenFMDeviation(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOFuncGenFMDeviation', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOFuncGenFMDeviation', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAOFuncGenFMDeviation', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOFuncGenFMDeviation', taskHandle, channel, data);
end
