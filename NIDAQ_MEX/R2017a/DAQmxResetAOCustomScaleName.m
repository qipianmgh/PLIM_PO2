% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOCustomScaleName(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOCustomScaleName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOCustomScaleName', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOCustomScaleName', taskHandle, channel);
end
