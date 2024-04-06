% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetDOUseOnlyOnBrdMem(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetDOUseOnlyOnBrdMem', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetDOUseOnlyOnBrdMem', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetDOUseOnlyOnBrdMem', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetDOUseOnlyOnBrdMem', taskHandle, channel, data);
end
