% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetScaleTableScaledVals(scaleName, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxGetScaleTableScaledVals', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetScaleTableScaledVals', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetScaleTableScaledVals', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetScaleTableScaledVals', scaleName, data, arraySizeInElements);
end
