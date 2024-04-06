% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIChanCalTablePreScaledVals(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIChanCalTablePreScaledVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIChanCalTablePreScaledVals', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIChanCalTablePreScaledVals', taskHandle, channel);
end
