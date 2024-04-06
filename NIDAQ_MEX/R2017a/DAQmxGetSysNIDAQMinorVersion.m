% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSysNIDAQMinorVersion(data)
    narginchk(1, 1);
    nargoutchk(2, 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSysNIDAQMinorVersion', 'data', 1);
    [status, data]= mexNIDAQmx('DAQmxGetSysNIDAQMinorVersion', data);
end
