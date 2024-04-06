% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCICount(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCICount', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCICount', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCICount', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCICount', taskHandle, channel, data);
end
