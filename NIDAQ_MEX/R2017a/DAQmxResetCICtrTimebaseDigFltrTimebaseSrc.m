% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICtrTimebaseDigFltrTimebaseSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICtrTimebaseDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICtrTimebaseDigFltrTimebaseSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICtrTimebaseDigFltrTimebaseSrc', taskHandle, channel);
end
