% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAODACRefExtSrc(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODACRefExtSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODACRefExtSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAODACRefExtSrc', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAODACRefExtSrc', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAODACRefExtSrc', taskHandle, channel, data, bufferSize);
end
