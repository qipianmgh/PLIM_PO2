% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCILinEncoderDistPerPulse(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCILinEncoderDistPerPulse', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCILinEncoderDistPerPulse', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCILinEncoderDistPerPulse', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCILinEncoderDistPerPulse', taskHandle, channel, data);
end
