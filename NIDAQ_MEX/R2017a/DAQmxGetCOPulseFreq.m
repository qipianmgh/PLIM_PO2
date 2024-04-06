% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOPulseFreq(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOPulseFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOPulseFreq', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCOPulseFreq', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOPulseFreq', taskHandle, channel, data);
end
