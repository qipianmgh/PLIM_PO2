% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWatchdogTimeout(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWatchdogTimeout', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetWatchdogTimeout', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWatchdogTimeout', taskHandle, data);
end
