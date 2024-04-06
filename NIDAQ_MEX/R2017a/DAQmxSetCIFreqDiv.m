% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIFreqDiv(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIFreqDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIFreqDiv', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIFreqDiv', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIFreqDiv', taskHandle, channel, data);
end
