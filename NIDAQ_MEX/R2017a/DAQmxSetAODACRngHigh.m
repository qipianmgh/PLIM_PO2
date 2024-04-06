% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAODACRngHigh(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAODACRngHigh', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAODACRngHigh', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAODACRngHigh', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAODACRngHigh', taskHandle, channel, data);
end
