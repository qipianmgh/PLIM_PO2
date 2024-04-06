% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetReadSleepTime(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetReadSleepTime', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetReadSleepTime', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetReadSleepTime', taskHandle, data);
end
