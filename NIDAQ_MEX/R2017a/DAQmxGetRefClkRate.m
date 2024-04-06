% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetRefClkRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRefClkRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetRefClkRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetRefClkRate', taskHandle, data);
end
