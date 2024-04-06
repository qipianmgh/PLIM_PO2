% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDITristate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDITristate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDITristate', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDITristate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDITristate', taskHandle, channel, data);
end
