% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIStrainGagePoissonRatio(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIStrainGagePoissonRatio', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIStrainGagePoissonRatio', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIStrainGagePoissonRatio', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIStrainGagePoissonRatio', taskHandle, channel, data);
end
