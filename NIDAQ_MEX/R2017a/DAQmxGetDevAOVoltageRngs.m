% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAOVoltageRngs(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAOVoltageRngs', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAOVoltageRngs', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAOVoltageRngs', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAOVoltageRngs', device, data, arraySizeInElements);
end
