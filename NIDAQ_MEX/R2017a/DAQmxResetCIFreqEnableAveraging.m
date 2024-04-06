% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIFreqEnableAveraging(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIFreqEnableAveraging', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIFreqEnableAveraging', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIFreqEnableAveraging', taskHandle, channel);
end
