% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetWatchdogDOExpirState(taskHandle, lines, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetWatchdogDOExpirState', 'taskHandle', 1);
    validateattributes(lines, {'char'}, {'vector'}, 'DAQmxSetWatchdogDOExpirState', 'lines', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetWatchdogDOExpirState', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetWatchdogDOExpirState', taskHandle, lines, data);
end
