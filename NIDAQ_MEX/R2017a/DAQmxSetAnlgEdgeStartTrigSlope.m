% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgEdgeStartTrigSlope(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgEdgeStartTrigSlope', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAnlgEdgeStartTrigSlope', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgEdgeStartTrigSlope', taskHandle, data);
end
