% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetStartTrigDelay(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetStartTrigDelay', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetStartTrigDelay', taskHandle);
end
