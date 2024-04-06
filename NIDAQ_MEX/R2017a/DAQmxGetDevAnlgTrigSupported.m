% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAnlgTrigSupported(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAnlgTrigSupported', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevAnlgTrigSupported', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevAnlgTrigSupported', device, data);
end
