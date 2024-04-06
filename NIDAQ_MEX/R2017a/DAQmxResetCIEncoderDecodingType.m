% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIEncoderDecodingType(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIEncoderDecodingType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIEncoderDecodingType', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIEncoderDecodingType', taskHandle, channel);
end
