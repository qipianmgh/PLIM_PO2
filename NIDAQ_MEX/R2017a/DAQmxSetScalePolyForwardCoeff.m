% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetScalePolyForwardCoeff(scaleName, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSetScalePolyForwardCoeff', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetScalePolyForwardCoeff', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetScalePolyForwardCoeff', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxSetScalePolyForwardCoeff', scaleName, data, arraySizeInElements);
end
