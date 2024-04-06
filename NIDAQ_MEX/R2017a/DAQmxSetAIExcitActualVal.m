% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIExcitActualVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIExcitActualVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIExcitActualVal', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIExcitActualVal', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIExcitActualVal', taskHandle, channel, data);
end
