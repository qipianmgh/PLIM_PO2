% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOCtrTimebaseActiveEdge(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOCtrTimebaseActiveEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOCtrTimebaseActiveEdge', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOCtrTimebaseActiveEdge', taskHandle, channel);
end
