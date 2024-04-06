% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICountEdgesActiveEdge(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICountEdgesActiveEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICountEdgesActiveEdge', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICountEdgesActiveEdge', taskHandle, channel);
end
