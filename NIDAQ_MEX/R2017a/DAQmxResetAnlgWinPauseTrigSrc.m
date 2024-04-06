% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinPauseTrigSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinPauseTrigSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinPauseTrigSrc', taskHandle);
end
