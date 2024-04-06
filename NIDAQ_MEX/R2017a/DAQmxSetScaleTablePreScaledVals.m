% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetScaleTablePreScaledVals(scaleName, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSetScaleTablePreScaledVals', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetScaleTablePreScaledVals', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetScaleTablePreScaledVals', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxSetScaleTablePreScaledVals', scaleName, data, arraySizeInElements);
end
