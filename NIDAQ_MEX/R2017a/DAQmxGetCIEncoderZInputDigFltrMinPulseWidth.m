% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIEncoderZInputDigFltrMinPulseWidth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIEncoderZInputDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIEncoderZInputDigFltrMinPulseWidth', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIEncoderZInputDigFltrMinPulseWidth', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIEncoderZInputDigFltrMinPulseWidth', taskHandle, channel, data);
end
