% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseRate(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseRate', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseRate', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseRate', taskHandle, channel);
end
