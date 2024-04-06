% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOCtrTimebaseDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOCtrTimebaseDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCOCtrTimebaseDigSyncEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOCtrTimebaseDigSyncEnable', taskHandle, channel, data);
end
