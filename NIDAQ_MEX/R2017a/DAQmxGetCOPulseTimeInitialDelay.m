% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOPulseTimeInitialDelay(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOPulseTimeInitialDelay', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOPulseTimeInitialDelay', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCOPulseTimeInitialDelay', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOPulseTimeInitialDelay', taskHandle, channel, data);
end
