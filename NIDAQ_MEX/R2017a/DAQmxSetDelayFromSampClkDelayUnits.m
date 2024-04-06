% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDelayFromSampClkDelayUnits(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDelayFromSampClkDelayUnits', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDelayFromSampClkDelayUnits', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetDelayFromSampClkDelayUnits', taskHandle, data);
end
