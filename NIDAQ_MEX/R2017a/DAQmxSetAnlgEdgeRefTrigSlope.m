% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAnlgEdgeRefTrigSlope(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAnlgEdgeRefTrigSlope', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAnlgEdgeRefTrigSlope', 'data', 2);
    [status]= mexNIDAQmx('DAQmxSetAnlgEdgeRefTrigSlope', taskHandle, data);
end
