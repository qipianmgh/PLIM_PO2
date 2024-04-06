% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOAutoIncrCnt(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOAutoIncrCnt', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOAutoIncrCnt', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCOAutoIncrCnt', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOAutoIncrCnt', taskHandle, channel, data);
end
