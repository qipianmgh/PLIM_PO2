% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDOLineStatesDoneState(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDOLineStatesDoneState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDOLineStatesDoneState', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDOLineStatesDoneState', taskHandle, channel);
end
