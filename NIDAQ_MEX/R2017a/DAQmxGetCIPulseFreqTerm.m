% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPulseFreqTerm(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPulseFreqTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPulseFreqTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCIPulseFreqTerm', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCIPulseFreqTerm', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCIPulseFreqTerm', taskHandle, channel, data, bufferSize);
end
