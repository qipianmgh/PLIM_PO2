% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCILinEncoderDistPerPulse(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCILinEncoderDistPerPulse', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCILinEncoderDistPerPulse', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCILinEncoderDistPerPulse', taskHandle, channel);
end
