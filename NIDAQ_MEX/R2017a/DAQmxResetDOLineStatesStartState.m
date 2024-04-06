% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDOLineStatesStartState(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDOLineStatesStartState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDOLineStatesStartState', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDOLineStatesStartState', taskHandle, channel);
end
