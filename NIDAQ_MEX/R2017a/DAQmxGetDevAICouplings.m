% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevAICouplings(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevAICouplings', 'device', 1);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetDevAICouplings', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevAICouplings', device, data);
end
