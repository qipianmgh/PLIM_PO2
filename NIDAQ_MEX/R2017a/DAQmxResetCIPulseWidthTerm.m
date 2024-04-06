% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseWidthTerm(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseWidthTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseWidthTerm', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseWidthTerm', taskHandle, channel);
end
