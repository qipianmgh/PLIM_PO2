% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinRefTrigSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinRefTrigSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinRefTrigSrc', taskHandle);
end
