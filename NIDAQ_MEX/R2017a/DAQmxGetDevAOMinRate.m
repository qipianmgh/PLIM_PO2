% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAOMinRate(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAOMinRate', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAOMinRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevAOMinRate', device, data);
end
