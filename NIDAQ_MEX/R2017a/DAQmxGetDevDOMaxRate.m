% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevDOMaxRate(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevDOMaxRate', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevDOMaxRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevDOMaxRate', device, data);
end
