% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetChanIsGlobal(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetChanIsGlobal', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetChanIsGlobal', 'channel', 2);
    validateattributes(data, {'uint32'}, {'vector'}, 'DAQmxGetChanIsGlobal', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetChanIsGlobal', taskHandle, channel, data);
end
