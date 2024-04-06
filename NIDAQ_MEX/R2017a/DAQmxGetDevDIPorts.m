% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevDIPorts(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevDIPorts', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevDIPorts', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevDIPorts', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevDIPorts', device, data, bufferSize);
end
