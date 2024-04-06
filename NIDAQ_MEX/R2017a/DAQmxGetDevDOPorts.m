% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevDOPorts(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevDOPorts', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevDOPorts', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevDOPorts', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevDOPorts', device, data, bufferSize);
end
