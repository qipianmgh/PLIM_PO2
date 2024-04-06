% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAIVoltageRngs(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAIVoltageRngs', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAIVoltageRngs', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAIVoltageRngs', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAIVoltageRngs', device, data, arraySizeInElements);
end
