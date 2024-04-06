% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOLineStatesStartState(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOLineStatesStartState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOLineStatesStartState', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDOLineStatesStartState', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOLineStatesStartState', taskHandle, channel, data);
end
