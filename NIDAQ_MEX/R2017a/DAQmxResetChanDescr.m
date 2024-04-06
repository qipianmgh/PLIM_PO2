% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetChanDescr(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetChanDescr', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetChanDescr', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetChanDescr', taskHandle, channel);
end
