% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetWriteSleepTime(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetWriteSleepTime', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetWriteSleepTime', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetWriteSleepTime', taskHandle, data);
end
