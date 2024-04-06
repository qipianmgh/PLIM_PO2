% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetCIEncoderAInputDigFltrTimebaseSrc(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIEncoderAInputDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIEncoderAInputDigFltrTimebaseSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetCIEncoderAInputDigFltrTimebaseSrc', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxSetCIEncoderAInputDigFltrTimebaseSrc', taskHandle, channel, data);
end
