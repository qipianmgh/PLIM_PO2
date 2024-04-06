% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigPatternRefTrigWhen(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigPatternRefTrigWhen', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigPatternRefTrigWhen', taskHandle);
end
