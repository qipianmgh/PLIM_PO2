% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOCtrTimebaseDigFltrEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOCtrTimebaseDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOCtrTimebaseDigFltrEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOCtrTimebaseDigFltrEnable', taskHandle, channel);
end
