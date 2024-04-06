% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetExported20MHzTimebaseOutputTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetExported20MHzTimebaseOutputTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetExported20MHzTimebaseOutputTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetExported20MHzTimebaseOutputTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetExported20MHzTimebaseOutputTerm', taskHandle, data, bufferSize);
end
