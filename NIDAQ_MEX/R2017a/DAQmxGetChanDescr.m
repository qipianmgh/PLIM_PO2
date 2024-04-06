% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetChanDescr(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetChanDescr', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetChanDescr', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetChanDescr', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetChanDescr', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetChanDescr', taskHandle, channel, data, bufferSize);
end
