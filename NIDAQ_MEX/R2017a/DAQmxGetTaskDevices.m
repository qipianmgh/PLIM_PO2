% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetTaskDevices(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetTaskDevices', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetTaskDevices', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetTaskDevices', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetTaskDevices', taskHandle, data, bufferSize);
end
