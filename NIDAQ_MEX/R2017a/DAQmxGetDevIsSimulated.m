% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevIsSimulated(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevIsSimulated', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevIsSimulated', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevIsSimulated', device, data);
end
