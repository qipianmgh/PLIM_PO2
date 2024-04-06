% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAccessorySerialNums(device, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAccessorySerialNums', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevAccessorySerialNums', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetDevAccessorySerialNums', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAccessorySerialNums', device, data, arraySizeInElements);
end
