% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetup1124Cal(calHandle, channelName, range, dacValue)
    narginchk(4, 4);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxSetup1124Cal', 'calHandle', 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxSetup1124Cal', 'channelName', 2);
    validateattributes(range, {'int32'}, {'scalar'}, 'DAQmxSetup1124Cal', 'range', 3);
    validateattributes(dacValue, {'uint32'}, {'scalar'}, 'DAQmxSetup1124Cal', 'dacValue', 4);
    [status]= mexNIDAQmx('DAQmxSetup1124Cal', calHandle, channelName, range, dacValue);
end
