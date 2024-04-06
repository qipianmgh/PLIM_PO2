% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigPatternRefTrigSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigPatternRefTrigSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigPatternRefTrigSrc', taskHandle);
end
