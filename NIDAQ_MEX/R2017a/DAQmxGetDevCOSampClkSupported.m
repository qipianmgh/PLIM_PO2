% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevCOSampClkSupported(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevCOSampClkSupported', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevCOSampClkSupported', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevCOSampClkSupported', device, data);
end
