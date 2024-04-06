% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigPatternStartTrigSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigPatternStartTrigSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigPatternStartTrigSrc', taskHandle);
end
