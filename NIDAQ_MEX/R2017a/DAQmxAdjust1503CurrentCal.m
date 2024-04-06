% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxAdjust1503CurrentCal(calHandle, channelName, measCurrent)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(calHandle, {'uint32'}, {'scalar'}, 'DAQmxAdjust1503CurrentCal', 'calHandle', 1);
    validateattributes(channelName, {'char'}, {'vector'}, 'DAQmxAdjust1503CurrentCal', 'channelName', 2);
    validateattributes(measCurrent, {'double'}, {'scalar'}, 'DAQmxAdjust1503CurrentCal', 'measCurrent', 3);
    [status]= mexNIDAQmx('DAQmxAdjust1503CurrentCal', calHandle, channelName, measCurrent);
end
