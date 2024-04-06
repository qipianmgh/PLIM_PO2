% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICtrTimebaseMasterTimebaseDiv(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICtrTimebaseMasterTimebaseDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICtrTimebaseMasterTimebaseDiv', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICtrTimebaseMasterTimebaseDiv', taskHandle, channel);
end
