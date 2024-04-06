% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCICustomScaleName(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCICustomScaleName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCICustomScaleName', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCICustomScaleName', taskHandle, channel);
end
