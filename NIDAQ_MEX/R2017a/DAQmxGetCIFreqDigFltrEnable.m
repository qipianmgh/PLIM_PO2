% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIFreqDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIFreqDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIFreqDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCIFreqDigFltrEnable', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIFreqDigFltrEnable', taskHandle, channel, data);
end
