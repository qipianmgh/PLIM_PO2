% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDIAcquireOn(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDIAcquireOn', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDIAcquireOn', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDIAcquireOn', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDIAcquireOn', taskHandle, channel, data);
end
