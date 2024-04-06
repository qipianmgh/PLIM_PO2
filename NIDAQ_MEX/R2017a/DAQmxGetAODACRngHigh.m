% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAODACRngHigh(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODACRngHigh', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODACRngHigh', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAODACRngHigh', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAODACRngHigh', taskHandle, channel, data);
end
