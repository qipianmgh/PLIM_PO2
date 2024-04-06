% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedSampClkTimebaseOutputTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedSampClkTimebaseOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetExportedSampClkTimebaseOutputTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetExportedSampClkTimebaseOutputTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetExportedSampClkTimebaseOutputTerm', taskHandle, data, bufferSize);
end
