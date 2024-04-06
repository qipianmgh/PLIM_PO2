% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseTimeStartEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseTimeStartEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseTimeStartEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIPulseTimeStartEdge', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseTimeStartEdge', taskHandle, channel, data);
end
