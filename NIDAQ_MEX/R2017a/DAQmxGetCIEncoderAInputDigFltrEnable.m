% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIEncoderAInputDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIEncoderAInputDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIEncoderAInputDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCIEncoderAInputDigFltrEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIEncoderAInputDigFltrEnable', taskHandle, channel, data);
end
