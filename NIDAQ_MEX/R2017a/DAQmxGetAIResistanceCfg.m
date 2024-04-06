% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIResistanceCfg(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIResistanceCfg', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIResistanceCfg', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIResistanceCfg', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIResistanceCfg', taskHandle, channel, data);
end
