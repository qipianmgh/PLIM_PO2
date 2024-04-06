% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgWinRefTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgWinRefTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAnlgWinRefTrigDigSyncEnable', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgWinRefTrigDigSyncEnable', taskHandle, data);
end
