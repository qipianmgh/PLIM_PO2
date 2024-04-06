% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPulseWidthStartingEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPulseWidthStartingEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPulseWidthStartingEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCIPulseWidthStartingEdge', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIPulseWidthStartingEdge', taskHandle, channel, data);
end
