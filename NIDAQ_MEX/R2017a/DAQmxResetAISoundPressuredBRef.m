% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAISoundPressuredBRef(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAISoundPressuredBRef', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAISoundPressuredBRef', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAISoundPressuredBRef', taskHandle, channel);
end
