% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetCIFreqDiv(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetCIFreqDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetCIFreqDiv', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetCIFreqDiv', taskHandle, channel);
end
