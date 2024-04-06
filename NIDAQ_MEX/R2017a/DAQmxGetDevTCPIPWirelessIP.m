% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevTCPIPWirelessIP(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevTCPIPWirelessIP', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevTCPIPWirelessIP', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevTCPIPWirelessIP', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevTCPIPWirelessIP', device, data, bufferSize);
end
