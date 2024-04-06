% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIEncoderZInputDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIEncoderZInputDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIEncoderZInputDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIEncoderZInputDigSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIEncoderZInputDigSyncEnable', taskHandle, channel, data);
end
