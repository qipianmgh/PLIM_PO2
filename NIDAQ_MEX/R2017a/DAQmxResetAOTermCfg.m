% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOTermCfg(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOTermCfg', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOTermCfg', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOTermCfg', taskHandle, channel);
end
