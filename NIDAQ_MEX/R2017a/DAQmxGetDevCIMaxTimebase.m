% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevCIMaxTimebase(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevCIMaxTimebase', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevCIMaxTimebase', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevCIMaxTimebase', device, data);
end
