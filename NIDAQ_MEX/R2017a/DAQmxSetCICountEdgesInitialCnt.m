% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCICountEdgesInitialCnt(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCICountEdgesInitialCnt', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCICountEdgesInitialCnt', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCICountEdgesInitialCnt', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCICountEdgesInitialCnt', taskHandle, channel, data);
end
