% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOConstrainedGenMode(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOConstrainedGenMode', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOConstrainedGenMode', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOConstrainedGenMode', taskHandle, channel);
end
