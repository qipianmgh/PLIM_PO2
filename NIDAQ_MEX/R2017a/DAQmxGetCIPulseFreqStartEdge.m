% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPulseFreqStartEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPulseFreqStartEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPulseFreqStartEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCIPulseFreqStartEdge', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIPulseFreqStartEdge', taskHandle, channel, data);
end
