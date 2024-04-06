% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetPhysicalChanName(taskHandle, channel, data, bufferSize)
    narginchk(4, 4);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetPhysicalChanName', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanName', 'channel', 2);
    validateattributes(data, {'char'}, {'vector'}, 'DAQmxGetPhysicalChanName', 'data', 3);
    validateattributes(bufferSize, {'uint32'}, {'scalar'}, 'DAQmxGetPhysicalChanName', 'bufferSize', 4);
    [status, data]= mexNIDAQmx('DAQmxGetPhysicalChanName', taskHandle, channel, data, bufferSize);
end
