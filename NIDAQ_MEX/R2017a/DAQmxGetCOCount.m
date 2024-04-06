% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetCOCount(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetCOCount', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetCOCount', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetCOCount', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetCOCount', taskHandle, channel, data);
end
