% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIResistanceUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIResistanceUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIResistanceUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIResistanceUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIResistanceUnits', taskHandle, channel, data);
end
