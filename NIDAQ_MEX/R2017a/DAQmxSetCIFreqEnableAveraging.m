% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIFreqEnableAveraging(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIFreqEnableAveraging', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIFreqEnableAveraging', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIFreqEnableAveraging', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIFreqEnableAveraging', taskHandle, channel, data);
end
