% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseWidthUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseWidthUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseWidthUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseWidthUnits', taskHandle, channel);
end
