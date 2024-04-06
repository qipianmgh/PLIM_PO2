% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOTermCfg(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOTermCfg', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOTermCfg', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAOTermCfg', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOTermCfg', taskHandle, channel, data);
end
