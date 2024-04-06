% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCILinEncoderUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCILinEncoderUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCILinEncoderUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCILinEncoderUnits', taskHandle, channel);
end
