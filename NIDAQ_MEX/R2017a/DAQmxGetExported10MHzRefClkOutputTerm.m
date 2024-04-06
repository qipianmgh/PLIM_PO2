% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExported10MHzRefClkOutputTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExported10MHzRefClkOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetExported10MHzRefClkOutputTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetExported10MHzRefClkOutputTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetExported10MHzRefClkOutputTerm', taskHandle, data, bufferSize);
end
