% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevDOLines(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevDOLines', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevDOLines', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevDOLines', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevDOLines', device, data, bufferSize);
end
