% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIAngEncoderInitialAngle(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIAngEncoderInitialAngle', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIAngEncoderInitialAngle', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIAngEncoderInitialAngle', taskHandle, channel);
end
