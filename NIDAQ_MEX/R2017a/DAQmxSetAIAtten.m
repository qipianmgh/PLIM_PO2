% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIAtten(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIAtten', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIAtten', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIAtten', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIAtten', taskHandle, channel, data);
end
