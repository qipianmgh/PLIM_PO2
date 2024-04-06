% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetChangeDetectDIFallingEdgePhysicalChans(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetChangeDetectDIFallingEdgePhysicalChans', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetChangeDetectDIFallingEdgePhysicalChans', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetChangeDetectDIFallingEdgePhysicalChans', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetChangeDetectDIFallingEdgePhysicalChans', taskHandle, data, bufferSize);
end
