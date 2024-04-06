% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOLineStatesDoneState(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOLineStatesDoneState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOLineStatesDoneState', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDOLineStatesDoneState', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOLineStatesDoneState', taskHandle, channel, data);
end
