% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgLvlPauseTrigCoupling(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgLvlPauseTrigCoupling', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgLvlPauseTrigCoupling', taskHandle);
end
