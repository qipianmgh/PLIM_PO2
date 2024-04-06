% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWatchdogDOExpirState(taskHandle, lines, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWatchdogDOExpirState', 'taskHandle', 1);
    validateattributes(lines, {'char'}, {'vector'}, 'DAQmxGetWatchdogDOExpirState', 'lines', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetWatchdogDOExpirState', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetWatchdogDOExpirState', taskHandle, lines, data);
end
