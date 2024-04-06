% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOLineStatesPausedState(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOLineStatesPausedState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOLineStatesPausedState', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDOLineStatesPausedState', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOLineStatesPausedState', taskHandle, channel, data);
end
