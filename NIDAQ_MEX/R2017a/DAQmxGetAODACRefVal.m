% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAODACRefVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODACRefVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODACRefVal', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAODACRefVal', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAODACRefVal', taskHandle, channel, data);
end
