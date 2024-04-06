% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPulseFreqInitialDelay(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPulseFreqInitialDelay', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPulseFreqInitialDelay', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPulseFreqInitialDelay', taskHandle, channel);
end
