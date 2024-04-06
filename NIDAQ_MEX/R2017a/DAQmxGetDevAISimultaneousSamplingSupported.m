% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAISimultaneousSamplingSupported(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAISimultaneousSamplingSupported', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevAISimultaneousSamplingSupported', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevAISimultaneousSamplingSupported', device, data);
end
