% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampClkTimebaseRate(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampClkTimebaseRate', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampClkTimebaseRate', taskHandle);
end
