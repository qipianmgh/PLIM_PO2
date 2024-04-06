% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIFreqHyst(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIFreqHyst', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIFreqHyst', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetAIFreqHyst', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIFreqHyst', taskHandle, channel, data);
end
