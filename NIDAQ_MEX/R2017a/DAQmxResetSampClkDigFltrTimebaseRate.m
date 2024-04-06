% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampClkDigFltrTimebaseRate(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampClkDigFltrTimebaseRate', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampClkDigFltrTimebaseRate', taskHandle);
end
