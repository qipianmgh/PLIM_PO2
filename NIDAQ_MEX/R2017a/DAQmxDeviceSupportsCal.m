% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, calSupported] = DAQmxDeviceSupportsCal(deviceName, calSupported)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(deviceName, {'char'}, {'vector'}, 'DAQmxDeviceSupportsCal', 'deviceName', 1);
    validateattributes(calSupported, {'uint32'}, {'vector'}, 'DAQmxDeviceSupportsCal', 'calSupported', 2);
    [status, calSupported]= mexNIDAQmx('DAQmxDeviceSupportsCal', deviceName, calSupported);
end
