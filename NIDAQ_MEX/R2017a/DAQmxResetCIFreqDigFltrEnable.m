% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIFreqDigFltrEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIFreqDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIFreqDigFltrEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIFreqDigFltrEnable', taskHandle, channel);
end
