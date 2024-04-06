% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIStrainGageCfg(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIStrainGageCfg', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIStrainGageCfg', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIStrainGageCfg', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIStrainGageCfg', taskHandle, channel, data);
end
