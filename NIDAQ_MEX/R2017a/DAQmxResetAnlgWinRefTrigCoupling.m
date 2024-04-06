% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinRefTrigCoupling(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinRefTrigCoupling', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinRefTrigCoupling', taskHandle);
end
