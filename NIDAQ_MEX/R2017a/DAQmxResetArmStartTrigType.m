% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetArmStartTrigType(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetArmStartTrigType', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetArmStartTrigType', taskHandle);
end
