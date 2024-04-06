% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIFreqStartingEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIFreqStartingEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIFreqStartingEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCIFreqStartingEdge', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIFreqStartingEdge', taskHandle, channel, data);
end
