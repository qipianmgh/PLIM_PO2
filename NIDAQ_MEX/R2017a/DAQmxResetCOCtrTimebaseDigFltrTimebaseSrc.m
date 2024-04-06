% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOCtrTimebaseDigFltrTimebaseSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOCtrTimebaseDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOCtrTimebaseDigFltrTimebaseSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOCtrTimebaseDigFltrTimebaseSrc', taskHandle, channel);
end
