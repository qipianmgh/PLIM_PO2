% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevDIMaxRate(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevDIMaxRate', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevDIMaxRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevDIMaxRate', device, data);
end
