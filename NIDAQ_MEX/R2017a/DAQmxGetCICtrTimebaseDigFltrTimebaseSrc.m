% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCICtrTimebaseDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCICtrTimebaseDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCICtrTimebaseDigFltrTimebaseSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCICtrTimebaseDigFltrTimebaseSrc', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCICtrTimebaseDigFltrTimebaseSrc', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCICtrTimebaseDigFltrTimebaseSrc', taskHandle, channel, data, bufferSize);
end
