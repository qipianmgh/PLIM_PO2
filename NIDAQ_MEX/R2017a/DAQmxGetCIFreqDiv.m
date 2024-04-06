% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIFreqDiv(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIFreqDiv', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIFreqDiv', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCIFreqDiv', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIFreqDiv', taskHandle, channel, data);
end
