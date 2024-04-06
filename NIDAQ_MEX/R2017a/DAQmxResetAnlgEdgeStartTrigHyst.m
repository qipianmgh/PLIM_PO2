% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgEdgeStartTrigHyst(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgEdgeStartTrigHyst', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgEdgeStartTrigHyst', taskHandle);
end
