% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeStartTrigDigFltrEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeStartTrigDigFltrEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeStartTrigDigFltrEnable', taskHandle);
end
