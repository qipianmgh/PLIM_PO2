% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigPatternPauseTrigPattern(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigPatternPauseTrigPattern', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigPatternPauseTrigPattern', taskHandle);
end
