% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOCtrTimebaseDigSyncEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOCtrTimebaseDigSyncEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOCtrTimebaseDigSyncEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCOCtrTimebaseDigSyncEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOCtrTimebaseDigSyncEnable', taskHandle, channel, data);
end
