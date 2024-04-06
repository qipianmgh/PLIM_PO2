% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, isLate] = DAQmxWaitForNextSampleClock(taskHandle, timeout, isLate)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxWaitForNextSampleClock', 'taskHandle', 1);
    validateattributes(timeout, {'double'}, {'scalar'}, 'DAQmxWaitForNextSampleClock', 'timeout', 2);
    validateattributes(isLate, {'uint32'}, {'vector'}, 'DAQmxWaitForNextSampleClock', 'isLate', 3);
    [status, isLate]= mexNIDAQmx('DAQmxWaitForNextSampleClock', taskHandle, timeout, isLate);
end
