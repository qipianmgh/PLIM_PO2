% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinStartTrigSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinStartTrigSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinStartTrigSrc', taskHandle);
end
