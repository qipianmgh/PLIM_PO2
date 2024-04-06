% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxSetScaleTableScaledVals(scaleName, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(scaleName, {'char'}, {'vector'}, 'DAQmxSetScaleTableScaledVals', 'scaleName', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxSetScaleTableScaledVals', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxSetScaleTableScaledVals', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxSetScaleTableScaledVals', scaleName, data, arraySizeInElements);
end
