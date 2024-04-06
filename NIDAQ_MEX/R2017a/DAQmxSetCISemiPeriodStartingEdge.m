% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCISemiPeriodStartingEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCISemiPeriodStartingEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCISemiPeriodStartingEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetCISemiPeriodStartingEdge', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCISemiPeriodStartingEdge', taskHandle, channel, data);
end
