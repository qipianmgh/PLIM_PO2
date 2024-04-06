% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIDupCountPrevent(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIDupCountPrevent', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIDupCountPrevent', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIDupCountPrevent', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIDupCountPrevent', taskHandle, channel, data);
end
