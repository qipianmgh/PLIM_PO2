% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIAutoZeroMode(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIAutoZeroMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIAutoZeroMode', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIAutoZeroMode', taskHandle, channel);
end
