% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCOPulseFreq(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCOPulseFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCOPulseFreq', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCOPulseFreq', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCOPulseFreq', taskHandle, channel, data);
end
