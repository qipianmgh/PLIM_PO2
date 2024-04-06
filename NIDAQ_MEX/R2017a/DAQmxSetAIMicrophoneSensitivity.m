% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIMicrophoneSensitivity(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIMicrophoneSensitivity', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIMicrophoneSensitivity', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIMicrophoneSensitivity', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIMicrophoneSensitivity', taskHandle, channel, data);
end
