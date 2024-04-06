% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetup1104Cal(calHandle, channelName)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxSetup1104Cal', 'calHandle', 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxSetup1104Cal', 'channelName', 2);
    [status]= mexNIDAQmx('DAQmxSetup1104Cal', calHandle, channelName);
end
