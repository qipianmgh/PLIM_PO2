% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIEncoderAInputDigFltrTimebaseRate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIEncoderAInputDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIEncoderAInputDigFltrTimebaseRate', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIEncoderAInputDigFltrTimebaseRate', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIEncoderAInputDigFltrTimebaseRate', taskHandle, channel, data);
end
