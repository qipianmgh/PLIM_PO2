% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanTEDSVersionLetter(physicalChannel, data, bufferSize)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanTEDSVersionLetter', 'physicalChannel', 1);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanTEDSVersionLetter', 'data', 2);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetPhysicalChanTEDSVersionLetter', 'bufferSize', 3);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanTEDSVersionLetter', physicalChannel, data, bufferSize);
end
