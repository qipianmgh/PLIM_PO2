% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIPulseTimeTerm(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIPulseTimeTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIPulseTimeTerm', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIPulseTimeTerm', taskHandle, channel);
end
