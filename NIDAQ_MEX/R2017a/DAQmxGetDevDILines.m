% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevDILines(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevDILines', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevDILines', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevDILines', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevDILines', device, data, bufferSize);
end
