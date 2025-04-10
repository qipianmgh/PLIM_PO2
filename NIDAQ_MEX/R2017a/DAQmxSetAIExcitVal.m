% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIExcitVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIExcitVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIExcitVal', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIExcitVal', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIExcitVal', taskHandle, channel, data);
end
