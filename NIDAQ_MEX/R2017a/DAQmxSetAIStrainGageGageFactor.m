% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIStrainGageGageFactor(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIStrainGageGageFactor', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIStrainGageGageFactor', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIStrainGageGageFactor', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIStrainGageGageFactor', taskHandle, channel, data);
end
