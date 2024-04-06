% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeAdvTrigSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeAdvTrigSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeAdvTrigSrc', taskHandle);
end
