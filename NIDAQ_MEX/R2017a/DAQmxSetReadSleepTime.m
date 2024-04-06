% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetReadSleepTime(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetReadSleepTime', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetReadSleepTime', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetReadSleepTime', taskHandle, data);
end
