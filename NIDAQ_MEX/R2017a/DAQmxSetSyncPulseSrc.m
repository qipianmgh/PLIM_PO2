% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetSyncPulseSrc(taskHandle, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetSyncPulseSrc', 'taskHandle', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxSetSyncPulseSrc', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxSetSyncPulseSrc', taskHandle, data);
end
