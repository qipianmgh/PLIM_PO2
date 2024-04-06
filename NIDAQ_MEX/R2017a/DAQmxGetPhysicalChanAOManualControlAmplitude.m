% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanAOManualControlAmplitude(physicalChannel, data)
    narginchk(2, 2);
    nargoutchk(2, 2);
    validateattributes(physicalChannel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanAOManualControlAmplitude', 'physicalChannel', 1);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetPhysicalChanAOManualControlAmplitude', 'data', 2);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanAOManualControlAmplitude', physicalChannel, data);
end
