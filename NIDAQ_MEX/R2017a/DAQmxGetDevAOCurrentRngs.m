% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAOCurrentRngs(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAOCurrentRngs', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAOCurrentRngs', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAOCurrentRngs', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAOCurrentRngs', device, data, arraySizeInElements);
end
