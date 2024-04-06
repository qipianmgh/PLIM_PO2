% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIBridgePolyReverseCoeff(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgePolyReverseCoeff', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgePolyReverseCoeff', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetAIBridgePolyReverseCoeff', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetAIBridgePolyReverseCoeff', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxSetAIBridgePolyReverseCoeff', taskHandle, channel, data, arraySizeInElements);
end
