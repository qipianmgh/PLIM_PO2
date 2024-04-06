% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampClkTimingResponseMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkTimingResponseMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetSampClkTimingResponseMode', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampClkTimingResponseMode', taskHandle, data);
end
