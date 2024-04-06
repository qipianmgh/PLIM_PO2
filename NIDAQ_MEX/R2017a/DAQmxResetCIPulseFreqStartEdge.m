% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseFreqStartEdge(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseFreqStartEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseFreqStartEdge', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseFreqStartEdge', taskHandle, channel);
end
