% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetDevSerialNum(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetDevSerialNum', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetDevSerialNum', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetDevSerialNum', device, data);
end
