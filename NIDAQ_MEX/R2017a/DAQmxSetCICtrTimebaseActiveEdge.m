% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCICtrTimebaseActiveEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICtrTimebaseActiveEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICtrTimebaseActiveEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCICtrTimebaseActiveEdge', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCICtrTimebaseActiveEdge', taskHandle, channel, data);
end
