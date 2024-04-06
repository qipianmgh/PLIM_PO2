% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetup1125Cal(calHandle, channelName, gain)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxSetup1125Cal', 'calHandle', 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxSetup1125Cal', 'channelName', 2);
    validateattributes(gain, {'double'}, {'scalar'}, 'DAQmxSetup1125Cal', 'gain', 3);
    [status]= mexNIDAQmx('DAQmxSetup1125Cal', calHandle, channelName, gain);
end
