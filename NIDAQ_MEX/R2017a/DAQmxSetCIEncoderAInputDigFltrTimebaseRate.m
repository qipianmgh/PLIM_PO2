% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIEncoderAInputDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIEncoderAInputDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIEncoderAInputDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIEncoderAInputDigFltrTimebaseRate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIEncoderAInputDigFltrTimebaseRate', taskHandle, channel, data);
end
