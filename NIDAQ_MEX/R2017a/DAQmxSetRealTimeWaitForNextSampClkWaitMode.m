% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetRealTimeWaitForNextSampClkWaitMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetRealTimeWaitForNextSampClkWaitMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetRealTimeWaitForNextSampClkWaitMode', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetRealTimeWaitForNextSampClkWaitMode', taskHandle, data);
end
