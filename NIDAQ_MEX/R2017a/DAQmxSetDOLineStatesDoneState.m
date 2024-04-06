% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOLineStatesDoneState(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOLineStatesDoneState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOLineStatesDoneState', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDOLineStatesDoneState', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOLineStatesDoneState', taskHandle, channel, data);
end
