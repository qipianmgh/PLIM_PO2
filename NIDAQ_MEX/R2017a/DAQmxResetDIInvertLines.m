% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDIInvertLines(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDIInvertLines', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDIInvertLines', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDIInvertLines', taskHandle, channel);
end
