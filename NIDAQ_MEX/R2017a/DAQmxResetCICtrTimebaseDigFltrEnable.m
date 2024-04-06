% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICtrTimebaseDigFltrEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICtrTimebaseDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICtrTimebaseDigFltrEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICtrTimebaseDigFltrEnable', taskHandle, channel);
end
