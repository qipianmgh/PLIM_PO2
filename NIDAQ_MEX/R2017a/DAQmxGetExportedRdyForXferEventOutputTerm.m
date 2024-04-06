% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedRdyForXferEventOutputTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedRdyForXferEventOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetExportedRdyForXferEventOutputTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetExportedRdyForXferEventOutputTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetExportedRdyForXferEventOutputTerm', taskHandle, data, bufferSize);
end
