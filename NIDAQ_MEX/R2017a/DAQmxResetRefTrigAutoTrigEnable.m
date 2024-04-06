% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetRefTrigAutoTrigEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetRefTrigAutoTrigEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetRefTrigAutoTrigEnable', taskHandle);
end
