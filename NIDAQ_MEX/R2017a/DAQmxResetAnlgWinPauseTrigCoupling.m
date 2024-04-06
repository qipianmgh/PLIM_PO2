% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinPauseTrigCoupling(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinPauseTrigCoupling', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinPauseTrigCoupling', taskHandle);
end
