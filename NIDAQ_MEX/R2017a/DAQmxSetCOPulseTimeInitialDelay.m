% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOPulseTimeInitialDelay(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseTimeInitialDelay', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseTimeInitialDelay', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCOPulseTimeInitialDelay', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOPulseTimeInitialDelay', taskHandle, channel, data);
end
