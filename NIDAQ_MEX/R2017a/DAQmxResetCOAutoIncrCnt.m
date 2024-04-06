% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCOAutoIncrCnt(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCOAutoIncrCnt', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCOAutoIncrCnt', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCOAutoIncrCnt', taskHandle, channel);
end
