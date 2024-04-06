% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAODACOffsetExtSrc(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODACOffsetExtSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODACOffsetExtSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetAODACOffsetExtSrc', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetAODACOffsetExtSrc', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAODACOffsetExtSrc', taskHandle, channel, data, bufferSize);
end
