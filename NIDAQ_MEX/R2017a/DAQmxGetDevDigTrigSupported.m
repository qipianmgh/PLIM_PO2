% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevDigTrigSupported(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevDigTrigSupported', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevDigTrigSupported', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevDigTrigSupported', device, data);
end
