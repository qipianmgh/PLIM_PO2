% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAccessoryProductNums(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAccessoryProductNums', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevAccessoryProductNums', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAccessoryProductNums', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAccessoryProductNums', device, data, arraySizeInElements);
end
