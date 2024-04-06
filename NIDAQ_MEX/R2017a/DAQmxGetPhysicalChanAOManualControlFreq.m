% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanAOManualControlFreq(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanAOManualControlFreq', 'physicalChannel', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetPhysicalChanAOManualControlFreq', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanAOManualControlFreq', physicalChannel, data);
end
