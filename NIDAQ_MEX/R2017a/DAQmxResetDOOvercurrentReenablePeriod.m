% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDOOvercurrentReenablePeriod(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDOOvercurrentReenablePeriod', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDOOvercurrentReenablePeriod', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDOOvercurrentReenablePeriod', taskHandle, channel);
end
