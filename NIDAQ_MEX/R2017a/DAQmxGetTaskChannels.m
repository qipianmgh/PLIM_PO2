% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetTaskChannels(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetTaskChannels', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetTaskChannels', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetTaskChannels', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetTaskChannels', taskHandle, data, bufferSize);
end
