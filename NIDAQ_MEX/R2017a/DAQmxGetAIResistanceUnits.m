% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIResistanceUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIResistanceUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIResistanceUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIResistanceUnits', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIResistanceUnits', taskHandle, channel, data);
end
