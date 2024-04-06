% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAODACRefConnToGnd(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAODACRefConnToGnd', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAODACRefConnToGnd', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAODACRefConnToGnd', taskHandle, channel);
end
