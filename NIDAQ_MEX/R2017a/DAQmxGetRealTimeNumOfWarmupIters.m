% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetRealTimeNumOfWarmupIters(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRealTimeNumOfWarmupIters', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetRealTimeNumOfWarmupIters', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetRealTimeNumOfWarmupIters', taskHandle, data);
end
