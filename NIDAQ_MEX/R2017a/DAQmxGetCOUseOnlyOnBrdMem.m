% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOUseOnlyOnBrdMem(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOUseOnlyOnBrdMem', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOUseOnlyOnBrdMem', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCOUseOnlyOnBrdMem', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOUseOnlyOnBrdMem', taskHandle, channel, data);
end
