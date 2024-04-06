% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseSrc(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseSrc', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCITwoEdgeSepSecondDigFltrTimebaseSrc', taskHandle, channel);
end
