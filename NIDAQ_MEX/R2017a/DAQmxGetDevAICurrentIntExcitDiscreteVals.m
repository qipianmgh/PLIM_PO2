% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAICurrentIntExcitDiscreteVals(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAICurrentIntExcitDiscreteVals', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAICurrentIntExcitDiscreteVals', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAICurrentIntExcitDiscreteVals', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAICurrentIntExcitDiscreteVals', device, data, arraySizeInElements);
end
