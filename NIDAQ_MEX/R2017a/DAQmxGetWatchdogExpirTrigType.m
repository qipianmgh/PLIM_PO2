% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWatchdogExpirTrigType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWatchdogExpirTrigType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetWatchdogExpirTrigType', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWatchdogExpirTrigType', taskHandle, data);
end
