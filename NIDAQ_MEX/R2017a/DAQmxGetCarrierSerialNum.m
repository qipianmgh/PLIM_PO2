% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCarrierSerialNum(device, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(device, {'char'}, {'vector'}, 'DAQmxGetCarrierSerialNum', 'device', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCarrierSerialNum', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetCarrierSerialNum', device, data);
end
