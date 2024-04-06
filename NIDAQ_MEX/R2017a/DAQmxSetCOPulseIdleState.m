% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOPulseIdleState(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseIdleState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseIdleState', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCOPulseIdleState', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOPulseIdleState', taskHandle, channel, data);
end
