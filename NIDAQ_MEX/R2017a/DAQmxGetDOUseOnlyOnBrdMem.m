% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDOUseOnlyOnBrdMem(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetDOUseOnlyOnBrdMem', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetDOUseOnlyOnBrdMem', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDOUseOnlyOnBrdMem', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDOUseOnlyOnBrdMem', taskHandle, channel, data);
end
