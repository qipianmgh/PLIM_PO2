% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIGain(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIGain', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIGain', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIGain', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIGain', taskHandle, channel, data);
end
