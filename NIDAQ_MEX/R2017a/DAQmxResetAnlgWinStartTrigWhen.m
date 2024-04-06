% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinStartTrigWhen(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinStartTrigWhen', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinStartTrigWhen', taskHandle);
end
