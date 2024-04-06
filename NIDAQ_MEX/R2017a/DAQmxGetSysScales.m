% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSysScales(data, bufferSize)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetSysScales', 'data', 1);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetSysScales', 'bufferSize', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSysScales', data, bufferSize);
end
