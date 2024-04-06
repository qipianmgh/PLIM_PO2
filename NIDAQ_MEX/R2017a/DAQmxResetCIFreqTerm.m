% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIFreqTerm(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIFreqTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIFreqTerm', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIFreqTerm', taskHandle, channel);
end
