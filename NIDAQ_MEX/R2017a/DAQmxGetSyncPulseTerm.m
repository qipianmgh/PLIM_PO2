% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSyncPulseTerm(taskHandle, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetSyncPulseTerm', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetSyncPulseTerm', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetSyncPulseTerm', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetSyncPulseTerm', taskHandle, data, bufferSize);
end
