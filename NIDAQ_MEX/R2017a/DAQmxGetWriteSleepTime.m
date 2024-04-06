% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetWriteSleepTime(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetWriteSleepTime', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetWriteSleepTime', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetWriteSleepTime', taskHandle, data);
end
