% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevTCPIPEthernetIP(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevTCPIPEthernetIP', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevTCPIPEthernetIP', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevTCPIPEthernetIP', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevTCPIPEthernetIP', device, data, bufferSize);
end
