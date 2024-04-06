% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIEncoderDecodingType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIEncoderDecodingType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIEncoderDecodingType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCIEncoderDecodingType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIEncoderDecodingType', taskHandle, channel, data);
end
