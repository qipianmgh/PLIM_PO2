% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevCISampClkSupported(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevCISampClkSupported', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevCISampClkSupported', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevCISampClkSupported', device, data);
end
