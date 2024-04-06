% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIStrainGageGageFactor(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIStrainGageGageFactor', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIStrainGageGageFactor', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIStrainGageGageFactor', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIStrainGageGageFactor', taskHandle, channel, data);
end
