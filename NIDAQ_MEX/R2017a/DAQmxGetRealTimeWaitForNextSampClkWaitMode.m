% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetRealTimeWaitForNextSampClkWaitMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRealTimeWaitForNextSampClkWaitMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetRealTimeWaitForNextSampClkWaitMode', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetRealTimeWaitForNextSampClkWaitMode', taskHandle, data);
end
