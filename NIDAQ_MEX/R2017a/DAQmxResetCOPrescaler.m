% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOPrescaler(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOPrescaler', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOPrescaler', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOPrescaler', taskHandle, channel);
end
