% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIFreqDigFltrTimebaseRate(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIFreqDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIFreqDigFltrTimebaseRate', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIFreqDigFltrTimebaseRate', taskHandle, channel);
end
