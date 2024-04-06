% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetAIChanCalPolyForwardCoeff(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIChanCalPolyForwardCoeff', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIChanCalPolyForwardCoeff', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetAIChanCalPolyForwardCoeff', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetAIChanCalPolyForwardCoeff', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxSetAIChanCalPolyForwardCoeff', taskHandle, channel, data, arraySizeInElements);
end
