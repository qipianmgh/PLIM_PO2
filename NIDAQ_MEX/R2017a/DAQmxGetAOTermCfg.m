% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOTermCfg(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOTermCfg', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOTermCfg', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAOTermCfg', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOTermCfg', taskHandle, channel, data);
end
