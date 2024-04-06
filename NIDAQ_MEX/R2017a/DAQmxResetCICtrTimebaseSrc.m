% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICtrTimebaseSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICtrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICtrTimebaseSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICtrTimebaseSrc', taskHandle, channel);
end
