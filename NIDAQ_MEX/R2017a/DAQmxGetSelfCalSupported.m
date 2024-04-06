% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetSelfCalSupported(deviceName, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxGetSelfCalSupported', 'deviceName', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetSelfCalSupported', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetSelfCalSupported', deviceName, data);
end
