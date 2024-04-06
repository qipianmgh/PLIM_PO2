% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxWriteToTEDSFromFile(physicalChannel, filePath, basicTEDSOptions)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxWriteToTEDSFromFile', 'physicalChannel', 1);
    validateattributes(filePath, {'char'}, {'vector'}, 'DAQmxWriteToTEDSFromFile', 'filePath', 2);
    validateattributes(basicTEDSOptions, {'int32'}, {'scalar'}, 'DAQmxWriteToTEDSFromFile', 'basicTEDSOptions', 3);
    [status]= mexNIDAQmx('DAQmxWriteToTEDSFromFile', physicalChannel, filePath, basicTEDSOptions);
end
