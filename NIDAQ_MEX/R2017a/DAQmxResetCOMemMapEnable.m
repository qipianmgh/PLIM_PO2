% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOMemMapEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOMemMapEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOMemMapEnable', taskHandle, channel);
end
