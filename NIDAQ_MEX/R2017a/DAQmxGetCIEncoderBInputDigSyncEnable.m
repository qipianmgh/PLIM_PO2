% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIEncoderBInputDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIEncoderBInputDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIEncoderBInputDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCIEncoderBInputDigSyncEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIEncoderBInputDigSyncEnable', taskHandle, channel, data);
end
