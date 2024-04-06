% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgLvlPauseTrigHyst(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgLvlPauseTrigHyst', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgLvlPauseTrigHyst', taskHandle);
end
