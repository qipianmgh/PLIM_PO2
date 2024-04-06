% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAnlgEdgeRefTrigSlope(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAnlgEdgeRefTrigSlope', 'taskHandle', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAnlgEdgeRefTrigSlope', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetAnlgEdgeRefTrigSlope', taskHandle, data);
end
