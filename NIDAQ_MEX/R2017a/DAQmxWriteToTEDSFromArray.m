% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxWriteToTEDSFromArray(physicalChannel, bitStream, arraySize, basicTEDSOptions)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxWriteToTEDSFromArray', 'physicalChannel', 1);
    validateattributes(bitStream, {'uint8'}, {'vector'}, 'DAQmxWriteToTEDSFromArray', 'bitStream', 2);
    validateattributes(arraySize, {'uint32'}, {'scalar'}, 'DAQmxWriteToTEDSFromArray', 'arraySize', 3);
    validateattributes(basicTEDSOptions, {'int32'}, {'scalar'}, 'DAQmxWriteToTEDSFromArray', 'basicTEDSOptions', 4);
    [status]= mexNIDAQmx('DAQmxWriteToTEDSFromArray', physicalChannel, bitStream, arraySize, basicTEDSOptions);
end
