% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampClkRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetSampClkRate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampClkRate', taskHandle, data);
end
