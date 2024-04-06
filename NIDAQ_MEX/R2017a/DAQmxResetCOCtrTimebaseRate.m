% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOCtrTimebaseRate(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOCtrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOCtrTimebaseRate', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOCtrTimebaseRate', taskHandle, channel);
end
