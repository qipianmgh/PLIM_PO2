% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseFreqTerm(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseFreqTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseFreqTerm', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseFreqTerm', taskHandle, channel);
end
