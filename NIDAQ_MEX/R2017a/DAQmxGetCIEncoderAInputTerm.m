% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIEncoderAInputTerm(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIEncoderAInputTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIEncoderAInputTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCIEncoderAInputTerm', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCIEncoderAInputTerm', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCIEncoderAInputTerm', taskHandle, channel, data, bufferSize);
end
