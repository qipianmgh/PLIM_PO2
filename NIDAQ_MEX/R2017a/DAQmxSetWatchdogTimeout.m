% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetWatchdogTimeout(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetWatchdogTimeout', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetWatchdogTimeout', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetWatchdogTimeout', taskHandle, data);
end
