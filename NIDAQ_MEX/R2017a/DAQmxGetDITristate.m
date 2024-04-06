% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDITristate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDITristate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDITristate', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDITristate', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDITristate', taskHandle, channel, data);
end
