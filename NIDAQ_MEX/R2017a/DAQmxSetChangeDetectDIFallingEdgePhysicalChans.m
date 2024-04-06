% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetChangeDetectDIFallingEdgePhysicalChans(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetChangeDetectDIFallingEdgePhysicalChans', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetChangeDetectDIFallingEdgePhysicalChans', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetChangeDetectDIFallingEdgePhysicalChans', taskHandle, data);
end
