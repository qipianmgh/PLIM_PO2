% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIFreqMeasTime(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIFreqMeasTime', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIFreqMeasTime', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIFreqMeasTime', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIFreqMeasTime', taskHandle, channel, data);
end
