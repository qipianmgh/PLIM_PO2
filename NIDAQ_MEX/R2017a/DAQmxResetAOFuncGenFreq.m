% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOFuncGenFreq(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOFuncGenFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOFuncGenFreq', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOFuncGenFreq', taskHandle, channel);
end
