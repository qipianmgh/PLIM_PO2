% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIChanCalDesc(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIChanCalDesc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIChanCalDesc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAIChanCalDesc', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAIChanCalDesc', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIChanCalDesc', taskHandle, channel, data, bufferSize);
end
