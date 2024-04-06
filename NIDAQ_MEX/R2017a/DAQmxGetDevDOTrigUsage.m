% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevDOTrigUsage(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevDOTrigUsage', 'device', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDevDOTrigUsage', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevDOTrigUsage', device, data);
end
