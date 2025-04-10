% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPulseWidthTerm(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPulseWidthTerm', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPulseWidthTerm', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetCIPulseWidthTerm', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetCIPulseWidthTerm', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetCIPulseWidthTerm', taskHandle, channel, data, bufferSize);
end
