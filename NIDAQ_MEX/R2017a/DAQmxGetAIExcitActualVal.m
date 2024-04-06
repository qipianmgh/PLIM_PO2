% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIExcitActualVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIExcitActualVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIExcitActualVal', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIExcitActualVal', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIExcitActualVal', taskHandle, channel, data);
end
