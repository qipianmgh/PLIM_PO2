% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIImpedance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIImpedance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIImpedance', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIImpedance', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIImpedance', taskHandle, channel, data);
end
