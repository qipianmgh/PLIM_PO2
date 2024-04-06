% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetWatchdogExpirTrigType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetWatchdogExpirTrigType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetWatchdogExpirTrigType', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetWatchdogExpirTrigType', taskHandle, data);
end
