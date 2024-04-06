% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetRealTimeNumOfWarmupIters(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetRealTimeNumOfWarmupIters', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetRealTimeNumOfWarmupIters', taskHandle);
end
