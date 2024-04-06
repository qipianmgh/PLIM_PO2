% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanAOManualControlShortDetected(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanAOManualControlShortDetected', 'physicalChannel', 1);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetPhysicalChanAOManualControlShortDetected', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanAOManualControlShortDetected', physicalChannel, data);
end
