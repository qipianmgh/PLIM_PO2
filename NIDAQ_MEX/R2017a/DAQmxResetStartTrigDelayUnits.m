% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetStartTrigDelayUnits(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetStartTrigDelayUnits', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetStartTrigDelayUnits', taskHandle);
end
