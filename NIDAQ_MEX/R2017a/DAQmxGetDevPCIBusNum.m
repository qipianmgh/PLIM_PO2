% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevPCIBusNum(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevPCIBusNum', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevPCIBusNum', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevPCIBusNum', device, data);
end
