% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOFuncGenFMDeviation(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOFuncGenFMDeviation', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOFuncGenFMDeviation', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOFuncGenFMDeviation', taskHandle, channel);
end
