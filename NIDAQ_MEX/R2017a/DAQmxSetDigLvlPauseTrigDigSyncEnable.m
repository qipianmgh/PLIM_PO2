% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDigLvlPauseTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDigLvlPauseTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDigLvlPauseTrigDigSyncEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDigLvlPauseTrigDigSyncEnable', taskHandle, data);
end
