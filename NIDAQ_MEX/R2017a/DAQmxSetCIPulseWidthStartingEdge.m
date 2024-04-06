% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseWidthStartingEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseWidthStartingEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseWidthStartingEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIPulseWidthStartingEdge', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseWidthStartingEdge', taskHandle, channel, data);
end
