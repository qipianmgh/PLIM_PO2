% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIRngLow(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIRngLow', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIRngLow', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIRngLow', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIRngLow', taskHandle, channel, data);
end
