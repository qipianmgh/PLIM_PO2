% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOLineStatesPausedState(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOLineStatesPausedState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOLineStatesPausedState', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetDOLineStatesPausedState', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOLineStatesPausedState', taskHandle, channel, data);
end
