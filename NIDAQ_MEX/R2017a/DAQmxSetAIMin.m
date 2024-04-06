% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIMin(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIMin', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIMin', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIMin', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIMin', taskHandle, channel, data);
end
