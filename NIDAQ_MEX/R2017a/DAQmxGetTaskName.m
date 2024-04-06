% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetTaskName(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetTaskName', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetTaskName', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetTaskName', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetTaskName', taskHandle, data, bufferSize);
end
