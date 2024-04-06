% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedDividedSampClkTimebaseOutputTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedDividedSampClkTimebaseOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetExportedDividedSampClkTimebaseOutputTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetExportedDividedSampClkTimebaseOutputTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetExportedDividedSampClkTimebaseOutputTerm', taskHandle, data, bufferSize);
end
