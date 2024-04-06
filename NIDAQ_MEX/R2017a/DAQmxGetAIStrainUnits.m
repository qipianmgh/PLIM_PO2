% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIStrainUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIStrainUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIStrainUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIStrainUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIStrainUnits', taskHandle, channel, data);
end
