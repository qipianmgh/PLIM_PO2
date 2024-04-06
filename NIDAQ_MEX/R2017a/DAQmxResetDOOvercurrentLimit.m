% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDOOvercurrentLimit(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDOOvercurrentLimit', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDOOvercurrentLimit', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDOOvercurrentLimit', taskHandle, channel);
end
