% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeStartTrigSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeStartTrigSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeStartTrigSrc', taskHandle);
end
