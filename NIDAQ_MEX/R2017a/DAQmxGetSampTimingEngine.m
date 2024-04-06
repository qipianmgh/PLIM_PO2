% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSampTimingEngine(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSampTimingEngine', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSampTimingEngine', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSampTimingEngine', taskHandle, data);
end
