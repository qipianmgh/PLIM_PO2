% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIFreqStartingEdge(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIFreqStartingEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIFreqStartingEdge', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIFreqStartingEdge', taskHandle, channel);
end
