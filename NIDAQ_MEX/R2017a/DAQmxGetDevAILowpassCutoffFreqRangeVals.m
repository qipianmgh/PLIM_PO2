% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAILowpassCutoffFreqRangeVals(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAILowpassCutoffFreqRangeVals', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAILowpassCutoffFreqRangeVals', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAILowpassCutoffFreqRangeVals', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAILowpassCutoffFreqRangeVals', device, data, arraySizeInElements);
end
