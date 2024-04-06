% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIStrainGagePoissonRatio(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIStrainGagePoissonRatio', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIStrainGagePoissonRatio', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIStrainGagePoissonRatio', taskHandle, channel);
end
