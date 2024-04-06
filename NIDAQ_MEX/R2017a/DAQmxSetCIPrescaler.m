% Copyright 2010 - 2015 The MathWorks, Inc.
function [status] = DAQmxSetCIPrescaler(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(1, 1);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxSetCIPrescaler', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxSetCIPrescaler', 'channel', 2);
    validateattributes(data, {'uint32'}, {'scalar'}, 'DAQmxSetCIPrescaler', 'data', 3);
    [status]= mexNIDAQmx('DAQmxSetCIPrescaler', taskHandle, channel, data);
end
