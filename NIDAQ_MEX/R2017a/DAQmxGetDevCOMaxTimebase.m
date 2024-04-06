% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevCOMaxTimebase(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevCOMaxTimebase', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevCOMaxTimebase', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevCOMaxTimebase', device, data);
end
