% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAICurrentRngs(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAICurrentRngs', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAICurrentRngs', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAICurrentRngs', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAICurrentRngs', device, data, arraySizeInElements);
end
