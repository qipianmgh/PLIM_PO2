% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDIAcquireOn(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDIAcquireOn', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDIAcquireOn', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDIAcquireOn', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDIAcquireOn', taskHandle, channel, data);
end
