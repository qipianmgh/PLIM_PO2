% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseTimeDigFltrTimebaseSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseTimeDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseTimeDigFltrTimebaseSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseTimeDigFltrTimebaseSrc', taskHandle, channel);
end
