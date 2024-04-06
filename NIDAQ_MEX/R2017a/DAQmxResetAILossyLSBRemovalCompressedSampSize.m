% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxResetAILossyLSBRemovalCompressedSampSize(taskHandle, channel)
    narginchk(2, 2);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxResetAILossyLSBRemovalCompressedSampSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxResetAILossyLSBRemovalCompressedSampSize', 'channel', 2);
    [status]= mexNIDAQmx('DAQmxResetAILossyLSBRemovalCompressedSampSize', taskHandle, channel);
end
