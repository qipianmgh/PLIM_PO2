% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIMin(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIMin', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIMin', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIMin', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIMin', taskHandle, channel, data);
end
