% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAOTrigUsage(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAOTrigUsage', 'device', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDevAOTrigUsage', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevAOTrigUsage', device, data);
end
