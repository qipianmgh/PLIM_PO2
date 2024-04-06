% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseTicksStartEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseTicksStartEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseTicksStartEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIPulseTicksStartEdge', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseTicksStartEdge', taskHandle, channel, data);
end
