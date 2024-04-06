% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevDITrigUsage(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevDITrigUsage', 'device', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDevDITrigUsage', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevDITrigUsage', device, data);
end
