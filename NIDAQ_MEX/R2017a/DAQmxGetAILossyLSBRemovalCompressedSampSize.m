% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAILossyLSBRemovalCompressedSampSize(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAILossyLSBRemovalCompressedSampSize', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAILossyLSBRemovalCompressedSampSize', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetAILossyLSBRemovalCompressedSampSize', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAILossyLSBRemovalCompressedSampSize', taskHandle, channel, data);
end
