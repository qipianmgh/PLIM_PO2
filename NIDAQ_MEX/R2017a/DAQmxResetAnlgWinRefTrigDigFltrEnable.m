% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgWinRefTrigDigFltrEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgWinRefTrigDigFltrEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgWinRefTrigDigFltrEnable', taskHandle);
end
