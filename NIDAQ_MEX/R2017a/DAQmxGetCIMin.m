% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIMin(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIMin', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIMin', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetCIMin', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIMin', taskHandle, channel, data);
end
