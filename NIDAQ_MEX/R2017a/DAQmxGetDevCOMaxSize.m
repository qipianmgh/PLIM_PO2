% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevCOMaxSize(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevCOMaxSize', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevCOMaxSize', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevCOMaxSize', device, data);
end
