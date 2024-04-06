% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCIOutputState(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCIOutputState', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCIOutputState', 'channel', 2);
    validateattributes(data, {'int32'}, {'vector'}, 'DAQmxGetCIOutputState', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCIOutputState', taskHandle, channel, data);
end
