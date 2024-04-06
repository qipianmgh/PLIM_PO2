% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIACExcitFreq(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIACExcitFreq', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIACExcitFreq', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIACExcitFreq', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIACExcitFreq', taskHandle, channel, data);
end
