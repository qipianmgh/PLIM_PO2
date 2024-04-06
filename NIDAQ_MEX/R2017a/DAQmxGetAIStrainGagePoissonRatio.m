% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIStrainGagePoissonRatio(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIStrainGagePoissonRatio', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIStrainGagePoissonRatio', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIStrainGagePoissonRatio', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIStrainGagePoissonRatio', taskHandle, channel, data);
end
