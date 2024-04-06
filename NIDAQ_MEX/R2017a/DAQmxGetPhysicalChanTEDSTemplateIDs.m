% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanTEDSTemplateIDs(physicalChannel, data, arraySizeInElements)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanTEDSTemplateIDs', 'physicalChannel', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPhysicalChanTEDSTemplateIDs', 'data', 2);
    validateattributes(arraySizeInElements, {'uint32'}, {'scalar'}, 'DAQmxGetPhysicalChanTEDSTemplateIDs', 'arraySizeInElements', 3);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanTEDSTemplateIDs', physicalChannel, data, arraySizeInElements);
end
