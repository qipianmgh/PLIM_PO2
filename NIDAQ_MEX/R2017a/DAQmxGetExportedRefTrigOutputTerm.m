% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedRefTrigOutputTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedRefTrigOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetExportedRefTrigOutputTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetExportedRefTrigOutputTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetExportedRefTrigOutputTerm', taskHandle, data, bufferSize);
end
