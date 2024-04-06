% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAODACRefAllowConnToGnd(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAODACRefAllowConnToGnd', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAODACRefAllowConnToGnd', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAODACRefAllowConnToGnd', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAODACRefAllowConnToGnd', taskHandle, channel, data);
end
