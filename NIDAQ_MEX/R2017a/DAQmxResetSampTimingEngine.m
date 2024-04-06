% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetSampTimingEngine(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetSampTimingEngine', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetSampTimingEngine', taskHandle);
end
