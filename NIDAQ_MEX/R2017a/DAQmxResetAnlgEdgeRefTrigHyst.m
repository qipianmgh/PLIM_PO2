% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgEdgeRefTrigHyst(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgEdgeRefTrigHyst', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgEdgeRefTrigHyst', taskHandle);
end
