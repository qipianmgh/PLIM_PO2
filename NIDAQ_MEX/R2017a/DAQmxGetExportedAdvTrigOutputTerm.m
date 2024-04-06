% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExportedAdvTrigOutputTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExportedAdvTrigOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetExportedAdvTrigOutputTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetExportedAdvTrigOutputTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetExportedAdvTrigOutputTerm', taskHandle, data, bufferSize);
end
