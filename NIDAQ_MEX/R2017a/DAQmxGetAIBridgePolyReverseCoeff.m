% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIBridgePolyReverseCoeff(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIBridgePolyReverseCoeff', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIBridgePolyReverseCoeff', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIBridgePolyReverseCoeff', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetAIBridgePolyReverseCoeff', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIBridgePolyReverseCoeff', taskHandle, channel, data, arraySizeInElements);
end
