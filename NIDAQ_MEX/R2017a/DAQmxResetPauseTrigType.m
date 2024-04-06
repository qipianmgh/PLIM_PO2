% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetPauseTrigType(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetPauseTrigType', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetPauseTrigType', taskHandle);
end
