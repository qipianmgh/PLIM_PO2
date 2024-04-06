% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedSampClkOutputTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedSampClkOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetExportedSampClkOutputTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetExportedSampClkOutputTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetExportedSampClkOutputTerm', taskHandle, data, bufferSize);
end
