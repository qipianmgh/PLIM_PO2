% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSyncPulseSrc(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSyncPulseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetSyncPulseSrc', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetSyncPulseSrc', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetSyncPulseSrc', taskHandle, data, bufferSize);
end
