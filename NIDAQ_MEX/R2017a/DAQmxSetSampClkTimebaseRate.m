% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampClkTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetSampClkTimebaseRate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampClkTimebaseRate', taskHandle, data);
end
