% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAOUseOnlyOnBrdMem(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAOUseOnlyOnBrdMem', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAOUseOnlyOnBrdMem', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAOUseOnlyOnBrdMem', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAOUseOnlyOnBrdMem', taskHandle, channel, data);
end
