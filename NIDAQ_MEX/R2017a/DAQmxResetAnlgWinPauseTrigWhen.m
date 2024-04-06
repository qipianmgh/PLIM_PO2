% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinPauseTrigWhen(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinPauseTrigWhen', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinPauseTrigWhen', taskHandle);
end
