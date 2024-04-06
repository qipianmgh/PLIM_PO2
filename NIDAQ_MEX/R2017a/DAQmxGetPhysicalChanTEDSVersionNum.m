% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanTEDSVersionNum(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanTEDSVersionNum', 'physicalChannel', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPhysicalChanTEDSVersionNum', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanTEDSVersionNum', physicalChannel, data);
end
