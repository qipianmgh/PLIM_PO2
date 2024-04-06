% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIEncoderBInputDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIEncoderBInputDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIEncoderBInputDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIEncoderBInputDigSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIEncoderBInputDigSyncEnable', taskHandle, channel, data);
end
