% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevCompactDAQChassisDevName(device, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevCompactDAQChassisDevName', 'device', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetDevCompactDAQChassisDevName', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetDevCompactDAQChassisDevName', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetDevCompactDAQChassisDevName', device, data, bufferSize);
end
