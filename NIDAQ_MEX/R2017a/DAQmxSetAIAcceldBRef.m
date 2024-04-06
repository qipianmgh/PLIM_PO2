% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIAcceldBRef(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIAcceldBRef', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIAcceldBRef', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIAcceldBRef', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIAcceldBRef', taskHandle, channel, data);
end
