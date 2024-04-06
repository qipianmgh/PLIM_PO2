% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCISemiPeriodStartingEdge(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCISemiPeriodStartingEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCISemiPeriodStartingEdge', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCISemiPeriodStartingEdge', taskHandle, channel);
end
