% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAITermCfg(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAITermCfg', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAITermCfg', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAITermCfg', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAITermCfg', taskHandle, channel, data);
end
