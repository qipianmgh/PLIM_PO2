% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCITwoEdgeSepUnits(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCITwoEdgeSepUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCITwoEdgeSepUnits', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCITwoEdgeSepUnits', taskHandle, channel);
end
