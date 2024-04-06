% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetChangeDetectDIFallingEdgePhysicalChans(taskHandle)
    narginchk(1, 1);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetChangeDetectDIFallingEdgePhysicalChans', 'taskHandle', 1);
    [status]= mexNIDAQmx('DAQmxResetChangeDetectDIFallingEdgePhysicalChans', taskHandle);
end
