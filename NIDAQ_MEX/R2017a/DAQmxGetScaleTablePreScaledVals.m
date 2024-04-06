% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScaleTablePreScaledVals(scaleName, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScaleTablePreScaledVals', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetScaleTablePreScaledVals', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetScaleTablePreScaledVals', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetScaleTablePreScaledVals', scaleName, data, arraySizeInElements);
end
