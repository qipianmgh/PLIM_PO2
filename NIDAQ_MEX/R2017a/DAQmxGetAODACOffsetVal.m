% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAODACOffsetVal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODACOffsetVal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODACOffsetVal', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAODACOffsetVal', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAODACOffsetVal', taskHandle, channel, data);
end
