% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCILinEncoderInitialPos(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCILinEncoderInitialPos', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCILinEncoderInitialPos', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCILinEncoderInitialPos', taskHandle, channel);
end
