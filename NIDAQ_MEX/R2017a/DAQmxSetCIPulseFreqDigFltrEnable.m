% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseFreqDigFltrEnable(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseFreqDigFltrEnable', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseFreqDigFltrEnable', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIPulseFreqDigFltrEnable', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseFreqDigFltrEnable', taskHandle, channel, data);
end
