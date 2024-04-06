% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxWaitUntilTaskDone(taskHandle, timeToWait)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWaitUntilTaskDone', 'taskHandle', 1);
    validateattributes(timeToWait, {'double'}, {'scalar'}, 'DAQmxWaitUntilTaskDone', 'timeToWait', 2);
    [status]= mexNIDAQmx('DAQmxWaitUntilTaskDone', taskHandle, timeToWait);
end
