% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgeTablePhysicalVals(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgeTablePhysicalVals', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgeTablePhysicalVals', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIBridgeTablePhysicalVals', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetAIBridgeTablePhysicalVals', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgeTablePhysicalVals', taskHandle, channel, data, arraySizeInElements);
end
