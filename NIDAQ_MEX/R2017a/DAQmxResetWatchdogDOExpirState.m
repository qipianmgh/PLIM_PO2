% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetWatchdogDOExpirState(taskHandle, lines)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetWatchdogDOExpirState', 'taskHandle', 1);
    validateattributes(lines, {'char'}, {'vector'}, 'DAQmxResetWatchdogDOExpirState', 'lines', 2);
    [status]= mexNIDAQmx('DAQmxResetWatchdogDOExpirState', taskHandle, lines);
end
