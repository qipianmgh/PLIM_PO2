% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseTicksDigFltrEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseTicksDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseTicksDigFltrEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseTicksDigFltrEnable', taskHandle, channel);
end
