% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAIMinRate(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAIMinRate', 'device', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetDevAIMinRate', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevAIMinRate', device, data);
end
