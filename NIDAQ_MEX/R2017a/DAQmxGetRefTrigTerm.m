% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetRefTrigTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetRefTrigTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetRefTrigTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetRefTrigTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetRefTrigTerm', taskHandle, data, bufferSize);
end
