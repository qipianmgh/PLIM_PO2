% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAOSampClkSupported(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAOSampClkSupported', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevAOSampClkSupported', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevAOSampClkSupported', device, data);
end
