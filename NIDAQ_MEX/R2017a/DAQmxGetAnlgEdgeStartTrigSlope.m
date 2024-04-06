% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgEdgeStartTrigSlope(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgEdgeStartTrigSlope', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAnlgEdgeStartTrigSlope', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgEdgeStartTrigSlope', taskHandle, data);
end
