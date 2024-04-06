% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDigLvlPauseTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDigLvlPauseTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDigLvlPauseTrigDigSyncEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDigLvlPauseTrigDigSyncEnable', taskHandle, data);
end
