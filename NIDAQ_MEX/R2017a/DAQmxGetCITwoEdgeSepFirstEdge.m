% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCITwoEdgeSepFirstEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCITwoEdgeSepFirstEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCITwoEdgeSepFirstEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCITwoEdgeSepFirstEdge', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCITwoEdgeSepFirstEdge', taskHandle, channel, data);
end
