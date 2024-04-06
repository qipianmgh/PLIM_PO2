% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAOGains(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAOGains', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAOGains', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAOGains', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAOGains', device, data, arraySizeInElements);
end
