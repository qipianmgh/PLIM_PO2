% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetScalePolyReverseCoeff(scaleName, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSetScalePolyReverseCoeff', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetScalePolyReverseCoeff', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetScalePolyReverseCoeff', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxSetScalePolyReverseCoeff', scaleName, data, arraySizeInElements);
end
