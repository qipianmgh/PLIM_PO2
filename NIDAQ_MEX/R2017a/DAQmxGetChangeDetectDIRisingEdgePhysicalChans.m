% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetChangeDetectDIRisingEdgePhysicalChans(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetChangeDetectDIRisingEdgePhysicalChans', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetChangeDetectDIRisingEdgePhysicalChans', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetChangeDetectDIRisingEdgePhysicalChans', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetChangeDetectDIRisingEdgePhysicalChans', taskHandle, data, bufferSize);
end
