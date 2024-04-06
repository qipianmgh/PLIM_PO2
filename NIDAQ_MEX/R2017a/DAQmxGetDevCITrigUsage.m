% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevCITrigUsage(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevCITrigUsage', 'device', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDevCITrigUsage', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevCITrigUsage', device, data);
end
