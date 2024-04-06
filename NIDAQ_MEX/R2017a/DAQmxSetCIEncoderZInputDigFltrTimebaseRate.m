% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIEncoderZInputDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIEncoderZInputDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIEncoderZInputDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIEncoderZInputDigFltrTimebaseRate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIEncoderZInputDigFltrTimebaseRate', taskHandle, channel, data);
end
