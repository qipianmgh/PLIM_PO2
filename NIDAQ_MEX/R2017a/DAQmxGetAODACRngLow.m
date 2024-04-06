% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAODACRngLow(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODACRngLow', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODACRngLow', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAODACRngLow', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAODACRngLow', taskHandle, channel, data);
end
