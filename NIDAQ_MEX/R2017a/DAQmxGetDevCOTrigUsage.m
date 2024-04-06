% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevCOTrigUsage(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevCOTrigUsage', 'device', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDevCOTrigUsage', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevCOTrigUsage', device, data);
end
