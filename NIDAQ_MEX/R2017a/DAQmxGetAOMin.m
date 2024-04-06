% Copyright 2010 - 2015 The MathWorks, Inc.
function [status, data] = DAQmxGetAOMin(taskHandle, channel, data)
    narginchk(3, 3);
    nargoutchk(2, 2);
    validateattributes(taskHandle, {'uint64'}, {'scalar'}, 'DAQmxGetAOMin', 'taskHandle', 1);
    validateattributes(channel, {'char'}, {'vector'}, 'DAQmxGetAOMin', 'channel', 2);
    validateattributes(data, {'double'}, {'vector'}, 'DAQmxGetAOMin', 'data', 3);
    [status, data]= mexNIDAQmx('DAQmxGetAOMin', taskHandle, channel, data);
end
