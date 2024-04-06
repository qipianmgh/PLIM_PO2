% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOTristate(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOTristate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOTristate', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDOTristate', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOTristate', taskHandle, channel, data);
end
