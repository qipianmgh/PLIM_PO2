% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetup433xCal(calHandle, channelNames, excitationVoltage)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxSetup433xCal', 'calHandle', 1);
    validateattributes(channelNames, {'char'}, {'vector'}, 'DAQmxSetup433xCal', 'channelNames', 2);
    validateattributes(excitationVoltage, {'double'}, {'scalar'}, 'DAQmxSetup433xCal', 'excitationVoltage', 3);
    [status]= mexNIDAQmx('DAQmxSetup433xCal', calHandle, channelNames, excitationVoltage);
end
