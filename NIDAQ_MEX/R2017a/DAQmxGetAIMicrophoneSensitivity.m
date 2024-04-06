% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIMicrophoneSensitivity(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIMicrophoneSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIMicrophoneSensitivity', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIMicrophoneSensitivity', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIMicrophoneSensitivity', taskHandle, channel, data);
end
