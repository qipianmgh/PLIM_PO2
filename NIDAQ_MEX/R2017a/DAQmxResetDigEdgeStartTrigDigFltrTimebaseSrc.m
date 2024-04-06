% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDigEdgeStartTrigDigFltrTimebaseSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDigEdgeStartTrigDigFltrTimebaseSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetDigEdgeStartTrigDigFltrTimebaseSrc', taskHandle);
end
