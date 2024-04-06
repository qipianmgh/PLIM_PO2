% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAITrigUsage(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAITrigUsage', 'device', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDevAITrigUsage', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevAITrigUsage', device, data);
end
