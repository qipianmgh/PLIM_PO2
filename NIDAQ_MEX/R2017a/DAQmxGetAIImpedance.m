% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIImpedance(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIImpedance', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIImpedance', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIImpedance', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIImpedance', taskHandle, channel, data);
end
