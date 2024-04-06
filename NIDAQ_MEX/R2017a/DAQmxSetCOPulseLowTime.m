% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOPulseLowTime(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseLowTime', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseLowTime', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCOPulseLowTime', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOPulseLowTime', taskHandle, channel, data);
end
