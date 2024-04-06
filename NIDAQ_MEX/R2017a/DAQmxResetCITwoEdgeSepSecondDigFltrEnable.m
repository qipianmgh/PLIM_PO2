% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCITwoEdgeSepSecondDigFltrEnable(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCITwoEdgeSepSecondDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCITwoEdgeSepSecondDigFltrEnable', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCITwoEdgeSepSecondDigFltrEnable', taskHandle, channel);
end
