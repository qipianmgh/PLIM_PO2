% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPulseFreqDigFltrMinPulseWidth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPulseFreqDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPulseFreqDigFltrMinPulseWidth', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIPulseFreqDigFltrMinPulseWidth', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPulseFreqDigFltrMinPulseWidth', taskHandle, channel, data);
end
