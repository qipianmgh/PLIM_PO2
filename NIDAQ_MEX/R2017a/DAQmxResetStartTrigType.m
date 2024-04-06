% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetStartTrigType(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetStartTrigType', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetStartTrigType', taskHandle);
end
