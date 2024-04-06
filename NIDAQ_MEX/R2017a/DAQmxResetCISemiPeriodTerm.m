% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCISemiPeriodTerm(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCISemiPeriodTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCISemiPeriodTerm', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCISemiPeriodTerm', taskHandle, channel);
end
