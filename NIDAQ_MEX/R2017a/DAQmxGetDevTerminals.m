% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevTerminals(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevTerminals', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevTerminals', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevTerminals', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevTerminals', device, data, bufferSize);
end
