% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIFreqDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIFreqDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIFreqDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIFreqDigFltrEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIFreqDigFltrEnable', taskHandle, channel, data);
end
