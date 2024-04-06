% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampClkTimingResponseMode(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampClkTimingResponseMode', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampClkTimingResponseMode', taskHandle);
end
