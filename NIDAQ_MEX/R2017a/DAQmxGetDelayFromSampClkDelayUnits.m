% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDelayFromSampClkDelayUnits(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDelayFromSampClkDelayUnits', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDelayFromSampClkDelayUnits', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDelayFromSampClkDelayUnits', taskHandle, data);
end
