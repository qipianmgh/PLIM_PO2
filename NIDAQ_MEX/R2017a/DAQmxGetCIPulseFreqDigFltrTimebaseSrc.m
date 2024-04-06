% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPulseFreqDigFltrTimebaseSrc(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPulseFreqDigFltrTimebaseSrc', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPulseFreqDigFltrTimebaseSrc', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCIPulseFreqDigFltrTimebaseSrc', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCIPulseFreqDigFltrTimebaseSrc', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCIPulseFreqDigFltrTimebaseSrc', taskHandle, channel, data, bufferSize);
end
