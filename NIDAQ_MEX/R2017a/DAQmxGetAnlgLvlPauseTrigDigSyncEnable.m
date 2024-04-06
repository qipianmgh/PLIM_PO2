% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgLvlPauseTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgLvlPauseTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAnlgLvlPauseTrigDigSyncEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgLvlPauseTrigDigSyncEnable', taskHandle, data);
end
