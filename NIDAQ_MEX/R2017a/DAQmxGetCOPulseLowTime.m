% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOPulseLowTime(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOPulseLowTime', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOPulseLowTime', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCOPulseLowTime', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOPulseLowTime', taskHandle, channel, data);
end
