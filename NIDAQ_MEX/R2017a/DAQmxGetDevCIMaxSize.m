% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevCIMaxSize(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevCIMaxSize', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevCIMaxSize', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevCIMaxSize', device, data);
end
