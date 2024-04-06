% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAODACRngLow(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAODACRngLow', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAODACRngLow', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAODACRngLow', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAODACRngLow', taskHandle, channel, data);
end
