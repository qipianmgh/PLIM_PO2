% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOLineStatesStartState(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOLineStatesStartState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOLineStatesStartState', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDOLineStatesStartState', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOLineStatesStartState', taskHandle, channel, data);
end
