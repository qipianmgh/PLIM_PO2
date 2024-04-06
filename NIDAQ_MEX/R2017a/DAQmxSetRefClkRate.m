% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetRefClkRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetRefClkRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetRefClkRate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetRefClkRate', taskHandle, data);
end
