% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAIVoltageIntExcitDiscreteVals(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAIVoltageIntExcitDiscreteVals', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAIVoltageIntExcitDiscreteVals', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAIVoltageIntExcitDiscreteVals', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAIVoltageIntExcitDiscreteVals', device, data, arraySizeInElements);
end
