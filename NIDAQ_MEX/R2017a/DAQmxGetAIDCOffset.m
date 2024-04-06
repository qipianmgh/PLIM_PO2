% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIDCOffset(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIDCOffset', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIDCOffset', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIDCOffset', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIDCOffset', taskHandle, channel, data);
end
