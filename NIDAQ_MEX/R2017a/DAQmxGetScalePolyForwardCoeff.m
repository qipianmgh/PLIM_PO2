% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScalePolyForwardCoeff(scaleName, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScalePolyForwardCoeff', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetScalePolyForwardCoeff', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetScalePolyForwardCoeff', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetScalePolyForwardCoeff', scaleName, data, arraySizeInElements);
end
