% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevPCIDevNum(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevPCIDevNum', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevPCIDevNum', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevPCIDevNum', device, data);
end
