% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIFreqDigFltrMinPulseWidth(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIFreqDigFltrMinPulseWidth', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIFreqDigFltrMinPulseWidth', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIFreqDigFltrMinPulseWidth', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIFreqDigFltrMinPulseWidth', taskHandle, channel, data);
end
