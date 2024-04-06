% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgEdgeStartTrigSlope(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgEdgeStartTrigSlope', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgEdgeStartTrigSlope', taskHandle);
end
