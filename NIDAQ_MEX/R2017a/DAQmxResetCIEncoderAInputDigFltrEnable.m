% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIEncoderAInputDigFltrEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIEncoderAInputDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIEncoderAInputDigFltrEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIEncoderAInputDigFltrEnable', taskHandle, channel);
end
