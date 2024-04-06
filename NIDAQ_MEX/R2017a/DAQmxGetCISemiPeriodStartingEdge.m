% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCISemiPeriodStartingEdge(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCISemiPeriodStartingEdge', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCISemiPeriodStartingEdge', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCISemiPeriodStartingEdge', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCISemiPeriodStartingEdge', taskHandle, channel, data);
end
