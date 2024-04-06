% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOTristate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOTristate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOTristate', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDOTristate', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOTristate', taskHandle, channel, data);
end
