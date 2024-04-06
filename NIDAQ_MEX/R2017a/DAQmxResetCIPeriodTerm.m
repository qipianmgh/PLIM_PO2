% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPeriodTerm(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPeriodTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPeriodTerm', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPeriodTerm', taskHandle, channel);
end
