% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCITwoEdgeSepFirstEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepFirstEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCITwoEdgeSepFirstEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCITwoEdgeSepFirstEdge', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCITwoEdgeSepFirstEdge', taskHandle, channel, data);
end
