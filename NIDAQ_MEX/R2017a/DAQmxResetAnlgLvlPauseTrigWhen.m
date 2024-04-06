% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgLvlPauseTrigWhen(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgLvlPauseTrigWhen', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgLvlPauseTrigWhen', taskHandle);
end
