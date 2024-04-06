% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAILowpassCutoffFreqDiscreteVals(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAILowpassCutoffFreqDiscreteVals', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAILowpassCutoffFreqDiscreteVals', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAILowpassCutoffFreqDiscreteVals', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAILowpassCutoffFreqDiscreteVals', device, data, arraySizeInElements);
end
