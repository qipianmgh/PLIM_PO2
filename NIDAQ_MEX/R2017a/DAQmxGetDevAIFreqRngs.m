% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAIFreqRngs(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAIFreqRngs', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAIFreqRngs', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAIFreqRngs', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAIFreqRngs', device, data, arraySizeInElements);
end
