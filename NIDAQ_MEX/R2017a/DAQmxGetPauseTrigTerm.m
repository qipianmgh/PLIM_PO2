% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPauseTrigTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetPauseTrigTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetPauseTrigTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetPauseTrigTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetPauseTrigTerm', taskHandle, data, bufferSize);
end
