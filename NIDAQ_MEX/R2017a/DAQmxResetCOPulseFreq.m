% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPulseFreq(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPulseFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPulseFreq', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPulseFreq', taskHandle, channel);
end
