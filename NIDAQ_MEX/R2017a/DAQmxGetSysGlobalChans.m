% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSysGlobalChans(data, bufferSize)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetSysGlobalChans', 'data', 1);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetSysGlobalChans', 'bufferSize', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSysGlobalChans', data, bufferSize);
end
