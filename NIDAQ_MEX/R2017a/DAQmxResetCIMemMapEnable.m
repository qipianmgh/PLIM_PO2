% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIMemMapEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIMemMapEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIMemMapEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIMemMapEnable', taskHandle, channel);
end
