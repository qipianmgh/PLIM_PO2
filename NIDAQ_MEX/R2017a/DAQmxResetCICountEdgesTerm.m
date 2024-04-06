% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICountEdgesTerm(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICountEdgesTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICountEdgesTerm', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICountEdgesTerm', taskHandle, channel);
end
