% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIBridgeTableElectricalVals(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeTableElectricalVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeTableElectricalVals', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetAIBridgeTableElectricalVals', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetAIBridgeTableElectricalVals', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxSetAIBridgeTableElectricalVals', taskHandle, channel, data, arraySizeInElements);
end
