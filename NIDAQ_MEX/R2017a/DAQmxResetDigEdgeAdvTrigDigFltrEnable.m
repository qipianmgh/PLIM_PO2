% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeAdvTrigDigFltrEnable(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeAdvTrigDigFltrEnable', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeAdvTrigDigFltrEnable', taskHandle);
end
