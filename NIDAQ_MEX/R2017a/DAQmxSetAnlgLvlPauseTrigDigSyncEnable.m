% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgLvlPauseTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgLvlPauseTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAnlgLvlPauseTrigDigSyncEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgLvlPauseTrigDigSyncEnable', taskHandle, data);
end
