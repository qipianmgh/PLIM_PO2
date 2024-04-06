% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAIMeasType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAIMeasType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAIMeasType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetAIMeasType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAIMeasType', taskHandle, channel, data);
end
