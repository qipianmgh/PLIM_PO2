% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIChanCalPolyForwardCoeff(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIChanCalPolyForwardCoeff', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIChanCalPolyForwardCoeff', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIChanCalPolyForwardCoeff', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetAIChanCalPolyForwardCoeff', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIChanCalPolyForwardCoeff', taskHandle, channel, data, arraySizeInElements);
end
