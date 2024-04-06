% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigPatternRefTrigPattern(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigPatternRefTrigPattern', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigPatternRefTrigPattern', taskHandle);
end
