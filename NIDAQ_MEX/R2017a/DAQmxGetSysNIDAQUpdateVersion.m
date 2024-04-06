% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSysNIDAQUpdateVersion(data)
    narginchk(1, 1);
    nargoutchk(2, 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSysNIDAQUpdateVersion', 'data', 1);
    [status, data]= mexNIDAQmx('DAQmxGetSysNIDAQUpdateVersion', data);
end
