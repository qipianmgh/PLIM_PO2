% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIMeasType(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIMeasType', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIMeasType', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCIMeasType', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIMeasType', taskHandle, channel, data);
end
