% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetChangeDetectDIRisingEdgePhysicalChans(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetChangeDetectDIRisingEdgePhysicalChans', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetChangeDetectDIRisingEdgePhysicalChans', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetChangeDetectDIRisingEdgePhysicalChans', taskHandle, data);
end
