% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOMemMapEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOMemMapEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOMemMapEnable', taskHandle, channel);
end
