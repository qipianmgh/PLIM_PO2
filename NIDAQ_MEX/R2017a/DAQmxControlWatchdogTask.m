% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxControlWatchdogTask(taskHandle, action)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxControlWatchdogTask', 'taskHandle', 1);
    validateattributes(action, {'int32'}, {'scalar'}, 'DAQmxControlWatchdogTask', 'action', 2);
    [status]= mexNIDAQmx('DAQmxControlWatchdogTask', taskHandle, action);
end
