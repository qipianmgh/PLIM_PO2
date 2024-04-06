% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIFreqMeasTime(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIFreqMeasTime', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIFreqMeasTime', 'channel', 2);
    validateattributes(data, {'double'}, {'scalar'}, 'DAQmxSetCIFreqMeasTime', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIFreqMeasTime', taskHandle, channel, data);
end
