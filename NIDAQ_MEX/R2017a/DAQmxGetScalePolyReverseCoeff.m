% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScalePolyReverseCoeff(scaleName, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScalePolyReverseCoeff', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetScalePolyReverseCoeff', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetScalePolyReverseCoeff', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetScalePolyReverseCoeff', scaleName, data, arraySizeInElements);
end
