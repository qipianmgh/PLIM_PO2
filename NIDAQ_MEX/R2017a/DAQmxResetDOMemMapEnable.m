% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetDOMemMapEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetDOMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetDOMemMapEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetDOMemMapEnable', taskHandle, channel);
end
