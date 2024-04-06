% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanTEDSBitStream(physicalChannel, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanTEDSBitStream', 'physicalChannel', 1);
    validateattributes(data, {'uint8'}, {'vector'}, 'DAQmxGetPhysicalChanTEDSBitStream', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetPhysicalChanTEDSBitStream', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanTEDSBitStream', physicalChannel, data, arraySizeInElements);
end
