% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSampClkDigFltrTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampClkDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetSampClkDigFltrTimebaseRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSampClkDigFltrTimebaseRate', taskHandle, data);
end
