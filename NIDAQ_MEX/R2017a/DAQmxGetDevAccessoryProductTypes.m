% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAccessoryProductTypes(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAccessoryProductTypes', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevAccessoryProductTypes', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevAccessoryProductTypes', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevAccessoryProductTypes', device, data, bufferSize);
end
