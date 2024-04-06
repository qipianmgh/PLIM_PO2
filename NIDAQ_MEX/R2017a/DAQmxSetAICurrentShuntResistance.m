% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAICurrentShuntResistance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAICurrentShuntResistance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAICurrentShuntResistance', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAICurrentShuntResistance', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAICurrentShuntResistance', taskHandle, channel, data);
end
