% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIStrainUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIStrainUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIStrainUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIStrainUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIStrainUnits', taskHandle, channel, data);
end
