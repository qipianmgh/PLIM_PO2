% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIEncoderAInputTerm(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIEncoderAInputTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIEncoderAInputTerm', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIEncoderAInputTerm', taskHandle, channel);
end
