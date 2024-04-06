% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPeriodStartingEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPeriodStartingEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPeriodStartingEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCIPeriodStartingEdge', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPeriodStartingEdge', taskHandle, channel, data);
end
