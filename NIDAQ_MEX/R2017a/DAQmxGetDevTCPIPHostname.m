% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevTCPIPHostname(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevTCPIPHostname', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevTCPIPHostname', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevTCPIPHostname', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevTCPIPHostname', device, data, bufferSize);
end
