% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDOInvertLines(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDOInvertLines', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDOInvertLines', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDOInvertLines', taskHandle, channel);
end
