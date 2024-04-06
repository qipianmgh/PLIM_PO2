% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIBridgePolyForwardCoeff(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIBridgePolyForwardCoeff', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIBridgePolyForwardCoeff', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetAIBridgePolyForwardCoeff', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetAIBridgePolyForwardCoeff', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxSetAIBridgePolyForwardCoeff', taskHandle, channel, data, arraySizeInElements);
end
