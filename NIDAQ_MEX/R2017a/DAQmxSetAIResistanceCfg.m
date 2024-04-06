% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIResistanceCfg(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIResistanceCfg', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIResistanceCfg', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIResistanceCfg', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIResistanceCfg', taskHandle, channel, data);
end
