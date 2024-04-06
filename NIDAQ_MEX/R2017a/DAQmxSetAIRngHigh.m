% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIRngHigh(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIRngHigh', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIRngHigh', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIRngHigh', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIRngHigh', taskHandle, channel, data);
end
