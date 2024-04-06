% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseWidthStartingEdge(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseWidthStartingEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseWidthStartingEdge', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseWidthStartingEdge', taskHandle, channel);
end
