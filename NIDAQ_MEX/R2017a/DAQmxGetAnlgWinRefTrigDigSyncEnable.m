% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgWinRefTrigDigSyncEnable(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgWinRefTrigDigSyncEnable', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAnlgWinRefTrigDigSyncEnable', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgWinRefTrigDigSyncEnable', taskHandle, data);
end
