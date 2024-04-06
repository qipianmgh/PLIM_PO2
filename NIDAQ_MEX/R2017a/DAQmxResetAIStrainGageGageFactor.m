% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIStrainGageGageFactor(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIStrainGageGageFactor', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIStrainGageGageFactor', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIStrainGageGageFactor', taskHandle, channel);
end
