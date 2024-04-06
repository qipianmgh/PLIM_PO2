% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAILowpassEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAILowpassEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAILowpassEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAILowpassEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAILowpassEnable', taskHandle, channel, data);
end
