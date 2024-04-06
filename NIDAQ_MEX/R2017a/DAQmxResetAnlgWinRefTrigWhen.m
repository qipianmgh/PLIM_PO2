% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinRefTrigWhen(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinRefTrigWhen', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinRefTrigWhen', taskHandle);
end
