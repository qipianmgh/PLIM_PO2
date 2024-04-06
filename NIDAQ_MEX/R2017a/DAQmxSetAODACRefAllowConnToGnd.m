% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAODACRefAllowConnToGnd(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAODACRefAllowConnToGnd', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAODACRefAllowConnToGnd', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetAODACRefAllowConnToGnd', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAODACRefAllowConnToGnd', taskHandle, channel, data);
end
