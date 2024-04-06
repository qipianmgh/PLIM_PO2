% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOFuncGenFreq(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOFuncGenFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOFuncGenFreq', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAOFuncGenFreq', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOFuncGenFreq', taskHandle, channel, data);
end
