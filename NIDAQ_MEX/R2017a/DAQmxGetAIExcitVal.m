% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIExcitVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIExcitVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIExcitVal', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIExcitVal', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIExcitVal', taskHandle, channel, data);
end
