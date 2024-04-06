% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanTEDSSerialNum(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanTEDSSerialNum', 'physicalChannel', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPhysicalChanTEDSSerialNum', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanTEDSSerialNum', physicalChannel, data);
end
