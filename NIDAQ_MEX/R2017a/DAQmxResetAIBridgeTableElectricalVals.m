% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAIBridgeTableElectricalVals(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAIBridgeTableElectricalVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAIBridgeTableElectricalVals', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAIBridgeTableElectricalVals', taskHandle, channel);
end
