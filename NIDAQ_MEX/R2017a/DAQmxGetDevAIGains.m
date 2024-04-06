% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAIGains(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAIGains', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAIGains', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAIGains', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAIGains', device, data, arraySizeInElements);
end
