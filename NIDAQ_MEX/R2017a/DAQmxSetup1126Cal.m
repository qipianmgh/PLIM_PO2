% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetup1126Cal(calHandle, channelName, upperFreqLimit)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxSetup1126Cal', 'calHandle', 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxSetup1126Cal', 'channelName', 2);
    validateattributes(upperFreqLimit, {'double'}, {'scalar'}, 'DAQmxSetup1126Cal', 'upperFreqLimit', 3);
    [status]= mexNIDAQmx('DAQmxSetup1126Cal', calHandle, channelName, upperFreqLimit);
end
