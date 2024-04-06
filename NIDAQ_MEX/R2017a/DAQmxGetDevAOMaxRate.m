% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAOMaxRate(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAOMaxRate', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAOMaxRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevAOMaxRate', device, data);
end
