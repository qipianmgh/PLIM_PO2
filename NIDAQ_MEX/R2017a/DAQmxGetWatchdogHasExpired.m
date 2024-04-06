% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWatchdogHasExpired(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWatchdogHasExpired', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetWatchdogHasExpired', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWatchdogHasExpired', taskHandle, data);
end
