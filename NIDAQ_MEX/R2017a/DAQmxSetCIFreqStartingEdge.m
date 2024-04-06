% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIFreqStartingEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIFreqStartingEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIFreqStartingEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIFreqStartingEdge', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIFreqStartingEdge', taskHandle, channel, data);
end
