% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetAIFreqUnits(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetAIFreqUnits', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetAIFreqUnits', 'channel', 2);
    validateattributes(data, {'int32'}, {'scalar'}, 'DAQmxSetAIFreqUnits', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetAIFreqUnits', taskHandle, channel, data);
end
