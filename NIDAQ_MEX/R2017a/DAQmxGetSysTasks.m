% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSysTasks(data, bufferSize)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetSysTasks', 'data', 1);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetSysTasks', 'bufferSize', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSysTasks', data, bufferSize);
end
