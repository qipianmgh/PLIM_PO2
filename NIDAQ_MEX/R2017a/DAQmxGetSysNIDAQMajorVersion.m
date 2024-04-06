% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSysNIDAQMajorVersion(data)
    narginchk(1, 1);
    nargoutchk(2, 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSysNIDAQMajorVersion', 'data', 1);
    [status, data]= mexNIDAQmx('DAQmxGetSysNIDAQMajorVersion', data);
end
