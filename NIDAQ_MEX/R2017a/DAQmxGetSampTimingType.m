% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSampTimingType(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampTimingType', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetSampTimingType', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSampTimingType', taskHandle, data);
end
