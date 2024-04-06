% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevProductType(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevProductType', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevProductType', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevProductType', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevProductType', device, data, bufferSize);
end
