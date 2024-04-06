% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOIdleOutputBehavior(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOIdleOutputBehavior', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOIdleOutputBehavior', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAOIdleOutputBehavior', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOIdleOutputBehavior', taskHandle, channel, data);
end
