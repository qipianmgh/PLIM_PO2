% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCILinEncoderDistPerPulse(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCILinEncoderDistPerPulse', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCILinEncoderDistPerPulse', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCILinEncoderDistPerPulse', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCILinEncoderDistPerPulse', taskHandle, channel, data);
end
