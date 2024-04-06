% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOCtrTimebaseMasterTimebaseDiv(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOCtrTimebaseMasterTimebaseDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOCtrTimebaseMasterTimebaseDiv', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOCtrTimebaseMasterTimebaseDiv', taskHandle, channel);
end
