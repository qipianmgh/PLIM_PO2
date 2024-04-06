% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinPauseTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinPauseTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAnlgWinPauseTrigDigSyncEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinPauseTrigDigSyncEnable', taskHandle, data);
end
