% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetSampTimingEngine(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSampTimingEngine', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetSampTimingEngine', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetSampTimingEngine', taskHandle, data);
end
