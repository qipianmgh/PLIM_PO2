% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOIdleOutputBehavior(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOIdleOutputBehavior', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOIdleOutputBehavior', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAOIdleOutputBehavior', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOIdleOutputBehavior', taskHandle, channel, data);
end
