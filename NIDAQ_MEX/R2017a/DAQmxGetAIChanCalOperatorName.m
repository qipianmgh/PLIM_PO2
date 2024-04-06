% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIChanCalOperatorName(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIChanCalOperatorName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIChanCalOperatorName', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAIChanCalOperatorName', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAIChanCalOperatorName', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIChanCalOperatorName', taskHandle, channel, data, bufferSize);
end
