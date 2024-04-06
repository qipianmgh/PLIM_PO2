% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCICtrTimebaseActiveEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCICtrTimebaseActiveEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCICtrTimebaseActiveEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCICtrTimebaseActiveEdge', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCICtrTimebaseActiveEdge', taskHandle, channel, data);
end
