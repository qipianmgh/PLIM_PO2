% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetRealTimeNumOfWarmupIters(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetRealTimeNumOfWarmupIters', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetRealTimeNumOfWarmupIters', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetRealTimeNumOfWarmupIters', taskHandle, data);
end
