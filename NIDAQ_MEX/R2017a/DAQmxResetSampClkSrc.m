% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampClkSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampClkSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampClkSrc', taskHandle);
end
