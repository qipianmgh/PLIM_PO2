% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSampClkTimingResponseMode(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampClkTimingResponseMode', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetSampClkTimingResponseMode', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSampClkTimingResponseMode', taskHandle, data);
end
