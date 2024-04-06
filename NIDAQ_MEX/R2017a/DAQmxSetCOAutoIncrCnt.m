% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOAutoIncrCnt(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOAutoIncrCnt', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOAutoIncrCnt', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCOAutoIncrCnt', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOAutoIncrCnt', taskHandle, channel, data);
end
