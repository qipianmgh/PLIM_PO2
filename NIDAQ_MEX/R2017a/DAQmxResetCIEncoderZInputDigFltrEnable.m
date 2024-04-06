% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIEncoderZInputDigFltrEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIEncoderZInputDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIEncoderZInputDigFltrEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIEncoderZInputDigFltrEnable', taskHandle, channel);
end
