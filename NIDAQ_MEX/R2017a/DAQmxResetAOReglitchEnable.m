% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAOReglitchEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAOReglitchEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAOReglitchEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAOReglitchEnable', taskHandle, channel);
end
