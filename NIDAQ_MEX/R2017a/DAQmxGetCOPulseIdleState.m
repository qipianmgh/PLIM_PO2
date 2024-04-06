% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOPulseIdleState(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOPulseIdleState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOPulseIdleState', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCOPulseIdleState', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOPulseIdleState', taskHandle, channel, data);
end
