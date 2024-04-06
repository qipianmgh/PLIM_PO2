% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOUseOnlyOnBrdMem(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOUseOnlyOnBrdMem', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOUseOnlyOnBrdMem', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCOUseOnlyOnBrdMem', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOUseOnlyOnBrdMem', taskHandle, channel, data);
end
