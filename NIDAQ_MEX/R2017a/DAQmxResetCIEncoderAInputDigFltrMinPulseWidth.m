% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIEncoderAInputDigFltrMinPulseWidth(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIEncoderAInputDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIEncoderAInputDigFltrMinPulseWidth', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIEncoderAInputDigFltrMinPulseWidth', taskHandle, channel);
end
