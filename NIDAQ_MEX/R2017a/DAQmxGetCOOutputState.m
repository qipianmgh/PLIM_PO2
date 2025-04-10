% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOOutputState(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOOutputState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOOutputState', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCOOutputState', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOOutputState', taskHandle, channel, data);
end
