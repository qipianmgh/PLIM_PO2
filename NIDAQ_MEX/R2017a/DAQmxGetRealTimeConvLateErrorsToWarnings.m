% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetRealTimeConvLateErrorsToWarnings(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRealTimeConvLateErrorsToWarnings', 'taskHandle', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetRealTimeConvLateErrorsToWarnings', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetRealTimeConvLateErrorsToWarnings', taskHandle, data);
end
