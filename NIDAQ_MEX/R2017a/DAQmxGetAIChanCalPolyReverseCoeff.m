% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIChanCalPolyReverseCoeff(taskHandle, channel, data, arraySizeInElements)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIChanCalPolyReverseCoeff', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIChanCalPolyReverseCoeff', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAIChanCalPolyReverseCoeff', 'data', 3);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetAIChanCalPolyReverseCoeff', 'arraySizeInElements', 4);
    [status, data]= mexNIDAQmx('DAQmxGetAIChanCalPolyReverseCoeff', taskHandle, channel, data, arraySizeInElements);
end
