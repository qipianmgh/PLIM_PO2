% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIEncoderZIndexVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIEncoderZIndexVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIEncoderZIndexVal', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIEncoderZIndexVal', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIEncoderZIndexVal', taskHandle, channel, data);
end
