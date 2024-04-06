% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAnlgEdgeRefTrigSrc(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAnlgEdgeRefTrigSrc', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetAnlgEdgeRefTrigSrc', taskHandle);
end
