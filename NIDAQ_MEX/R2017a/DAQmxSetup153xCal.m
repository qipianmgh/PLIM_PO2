% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetup153xCal(calHandle, channelName, gain)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxSetup153xCal', 'calHandle', 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxSetup153xCal', 'channelName', 2);
    validateattributes(gain, {'double'}, {'scalar'}, 'DAQmxSetup153xCal', 'gain', 3);
    [status]= mexNIDAQmx('DAQmxSetup153xCal', calHandle, channelName, gain);
end
