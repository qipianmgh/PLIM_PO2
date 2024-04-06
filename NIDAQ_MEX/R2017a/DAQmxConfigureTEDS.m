% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxConfigureTEDS(physicalChannel, filePath)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxConfigureTEDS', 'physicalChannel', 1);
    validateattributes(filePath, {'char'}, {'vector'}, 'DAQmxConfigureTEDS', 'filePath', 2);
    [status]= mexNIDAQmx('DAQmxConfigureTEDS', physicalChannel, filePath);
end
