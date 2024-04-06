% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIGPSSyncSrc(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIGPSSyncSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIGPSSyncSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCIGPSSyncSrc', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCIGPSSyncSrc', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCIGPSSyncSrc', taskHandle, channel, data, bufferSize);
end
