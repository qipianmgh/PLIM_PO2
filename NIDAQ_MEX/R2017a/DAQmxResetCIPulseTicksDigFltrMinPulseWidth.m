% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseTicksDigFltrMinPulseWidth(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseTicksDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseTicksDigFltrMinPulseWidth', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseTicksDigFltrMinPulseWidth', taskHandle, channel);
end
