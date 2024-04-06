% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIBridgeTablePhysicalVals(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgeTablePhysicalVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgeTablePhysicalVals', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetAIBridgeTablePhysicalVals', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetAIBridgeTablePhysicalVals', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxSetAIBridgeTablePhysicalVals', taskHandle, channel, data, arraySizeInElements);
end
