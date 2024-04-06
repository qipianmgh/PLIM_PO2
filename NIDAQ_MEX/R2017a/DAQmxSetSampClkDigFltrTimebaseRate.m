% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampClkDigFltrTimebaseRate(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampClkDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetSampClkDigFltrTimebaseRate', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampClkDigFltrTimebaseRate', taskHandle, data);
end
