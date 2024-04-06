% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinPauseTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinPauseTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAnlgWinPauseTrigDigSyncEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinPauseTrigDigSyncEnable', taskHandle, data);
end
