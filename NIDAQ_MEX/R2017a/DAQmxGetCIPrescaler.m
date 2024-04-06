% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIPrescaler(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIPrescaler', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIPrescaler', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCIPrescaler', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIPrescaler', taskHandle, channel, data);
end
