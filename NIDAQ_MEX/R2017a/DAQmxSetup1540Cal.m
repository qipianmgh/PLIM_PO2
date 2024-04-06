% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetup1540Cal(calHandle, channelName, excitationVoltage, excitationFreq)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxSetup1540Cal', 'calHandle', 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxSetup1540Cal', 'channelName', 2);
    validateattributes(excitationVoltage, {'double'}, {'scalar'}, 'DAQmxSetup1540Cal', 'excitationVoltage', 3);
    validateattributes(excitationFreq, {'double'}, {'scalar'}, 'DAQmxSetup1540Cal', 'excitationFreq', 4);
    [status]= mexNIDAQmx('DAQmxSetup1540Cal', calHandle, channelName, excitationVoltage, excitationFreq);
end
